import RxSwift
import RxCocoa
import UIKit
import Then
import SnapKit
import DesignSystem
import ResourcePackage
import InjectPropertyWrapper
import UtilityKit
import Logger
import Domain

final public class LoginViewController: BaseViewController, HasViewModel {
  // MARK: - Constants
  private enum UI {
    enum Color {
      static let navigationBackground: UIColor = .systemBlue
      static let navigationTitle: UIColor = .black
    }
  }
  
  // MARK: - Injection
  @Inject var viewModel: LoginViewModel
  
  // MARK: - UI
  private let loginView = LoginView(frame: .zero)

  // MARK: - View Life Cycle
  public override func loadView() {
    self.view = loginView
  }
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    bindUI()
  }

  override func setupConstraints() {
  }
}

extension LoginViewController {
  // MARK: - Layout
  private func setupNavigationBar() {
    self.navigationController?.navigationBar.barTintColor = UI.Color.navigationBackground
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UI.Color.navigationTitle]
    self.navigationItem.title = "Example"
  }

  // MARK: - Configuring
  private func bindUI() {
    // MARK: - Action
    let viewWillAppear = self.rx.viewWillAppear
      .take(1)
      .map { _ in Void() }
    let typeedIDTextField = loginView.emailTextField.rx.text.orEmpty.asObservable()
    let typedPasswordTextField = loginView.passwordTextField.rx.text.orEmpty.asObservable()
    let tappedLoginButton = loginView.loginButton.rx.throttleTap
      .withUnretained(self)
      .map { owner, _ in
        (owner.loginView.emailTextField.text ?? "", owner.loginView.passwordTextField.text ?? "")
      }

    let action = LoginViewModel.Action(
      viewWillAppear: viewWillAppear,
      typeedIDTextField: typeedIDTextField,
      typedPasswordTextField: typedPasswordTextField,
      tappedLoginButton: tappedLoginButton
    )

    // MARK: - State
    let state = viewModel.transform(action: action)

    state.cachingLoginID
      .drive(loginView.emailTextField.rx.text)
      .disposed(by: disposeBag)

    state.enableLoginButton
      .drive(loginView.loginButton.rx.isEnabled)
      .disposed(by: disposeBag)

    state.login
      .drive(onNext: { [weak self] response in
        guard let self = self else { return }
        switch response {
        case .success(let user):
          self.succeedLogin(user: user)
        case .failure(let error):
          self.failedLogin(error: error)
        }
      }).disposed(by: disposeBag)
  }

  private func failedLogin(error: Error) {
    let failedLoginAlert = UIAlertController(
			title: "FailedLoginAlertTitle".localized,
			message: "FailedLoginAlertMessage".localized,
      preferredStyle: .alert
    )

    let okayButtonAction = UIAlertAction(title: "OK", style: .default)
    failedLoginAlert.addAction(okayButtonAction)
    present(failedLoginAlert, animated: true, completion: nil)
  }

  private func succeedLogin(user: User) {
		let succeedLoginAlert = UIAlertController(
			title: "SucceedLoginAlertTitle".localized,
			message: "SucceedLoginAlertMessage".localized(user.name),
			preferredStyle: .alert
		)
		let okayButtonAction = UIAlertAction(
			title: "GoToMain".localized,
			style: .default
		) { _ in
      self.viewModel.routeToMain(userName: user.name)
    }
    succeedLoginAlert.addAction(okayButtonAction)
    present(succeedLoginAlert, animated: true, completion: nil)
  }
}
