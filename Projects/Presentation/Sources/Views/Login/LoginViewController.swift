import Foundation
import RxSwift
import RxCocoa
import RxViewController
import UIKit
import Then
import SnapKit
import DesignSystem
import InjectPropertyWrapper
import UtilityKit
import Logger

final class LoginViewController: BaseViewController, HasViewModel {
  // MARK: - Constants
  private enum UI {
    static let buttonHeight: CGFloat = 50
    
    /// Base
    static let horizontalMargin: CGFloat = 20
    static let viewVerticalSpacing: CGFloat = 10
    static let sectionVerticalSpacing: CGFloat = 20
    
    /// emailLabel
    static let emailLabelTopMargin: CGFloat = 50
    
    /// loginButton
    static let loginButtonTopMargin: CGFloat = 40
    
    
    enum Color {
      static let primaryColor: UIColor = .systemBlue
      static let primaryTextColor: UIColor = .white
      
      static let navigationBackground: UIColor = primaryColor
      static let background: UIColor = primaryTextColor
      static let navigationTitle: UIColor = primaryTextColor
      static let title: UIColor = .darkText
      static let placeholder: UIColor = .lightGray
      static let signupButtonTitle: UIColor = .darkText
      static let buttonBackground: UIColor = primaryColor
      static let buttonTilte: UIColor = primaryTextColor
    }
    
    enum Font {
      static let title = UIFont.boldSystemFont(ofSize: 24)
      static let inputTitle = UIFont.systemFont(ofSize: 15)
      static let buttonTitle = UIFont.boldSystemFont(ofSize: 20)
    }
  }
  
  @Inject var viewModel: LoginViewModel
  
  // MARK: - UI
  private let emailLabel = UILabel().then {
    $0.text = "이메일"
    $0.font = UI.Font.title
  }
  
  private let emailTextField = UITextField().then {
    $0.placeholder = "E-Mail"
    $0.font = UI.Font.inputTitle
    $0.borderStyle = .roundedRect
  }
  
  private let passwordLabel = UILabel().then {
    $0.text = "비밀번호"
    $0.font = UI.Font.title
  }
  
  private let passwordTextField = UITextField().then {
    $0.placeholder = "Password"
    $0.font = UI.Font.inputTitle
    $0.isSecureTextEntry = true
    $0.borderStyle = .roundedRect
  }
  
  private let loginButton = UIButton().then {
    $0.setTitle("로그인", for: .normal)
    $0.setTitleColor(UI.Color.buttonTilte, for: .normal)
    $0.titleLabel?.font = UI.Font.buttonTitle
    $0.backgroundColor = UI.Color.buttonBackground
  }
  
  // MARK: - Initialize
//  override init(viewModel: LoginViewModel) {
//    super.init()
//    self.viewModel = viewModel
//  }
  
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    setupUI()
    bindUI()
  }
  
  override func setupConstraints() {
    layout()
  }
}


extension LoginViewController {
  // MARK: - Layout
  private func setupNavigationBar() {
    self.navigationController?.navigationBar.barTintColor = UI.Color.navigationBackground
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UI.Color.navigationTitle]
    self.navigationItem.title = "TodoRIBs"
  }
  
  private func setupUI() {
    view.backgroundColor = UI.Color.background
    view.addSubview(emailLabel)
    view.addSubview(emailTextField)
    view.addSubview(passwordLabel)
    view.addSubview(passwordTextField)
    view.addSubview(loginButton)
  }
  
  private func layout() {
    emailLabel.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(UI.emailLabelTopMargin)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    emailTextField.snp.makeConstraints {
      $0.top.equalTo(emailLabel.snp.bottom).offset(UI.viewVerticalSpacing)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    passwordLabel.snp.makeConstraints {
      $0.top.equalTo(emailTextField.snp.bottom).offset(UI.sectionVerticalSpacing)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    passwordTextField.snp.makeConstraints {
      $0.top.equalTo(passwordLabel.snp.bottom).offset(UI.viewVerticalSpacing)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    loginButton.snp.makeConstraints {
      $0.top.equalTo(passwordTextField.snp.bottom).offset(UI.loginButtonTopMargin)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
      $0.height.equalTo(UI.buttonHeight)
    }
    
  }
  
  // MARK: - Configuring
  private func bindUI() {
    // MARK: - Action
    let viewWillAppear = self.rx.viewWillAppear
      .take(1)
      .map { _ in Void() }
    let typeedIDTextField = emailTextField.rx.text.orEmpty.asObservable()
    let typedPasswordTextField = passwordTextField.rx.text.orEmpty.asObservable()
    let tappedLoginButton = loginButton.rx.throttleTap
      .map{ (self.emailTextField.text ?? "", self.passwordTextField.text ?? "") }
    
    let action = LoginViewModel.Action(
      viewWillAppear: viewWillAppear,
      typeedIDTextField: typeedIDTextField,
      typedPasswordTextField: typedPasswordTextField,
      tappedLoginButton: tappedLoginButton
    )
    
    // MARK: - State
    let state = viewModel.transform(action: action)
    
    state.cachingLoginID
      .drive(emailTextField.rx.text)
      .disposed(by: disposeBag)
    
    state.enableLoginButton
      .drive(loginButton.rx.isEnabled)
      .disposed(by: disposeBag)
    
    state.login
      .drive(onNext: { response in
        Logger.d(response)
      }).disposed(by: disposeBag)
  }
  
  internal func failedLogin(error: LoginError) {
    let failedLoginAlert = UIAlertController(
      title: "로그인 실패",
      message: "잘못된 로그인 정보를 입력했습니다.",
      preferredStyle: .alert
    )
    
    let okayButtonAction = UIAlertAction(title: "OK", style: .default)
    failedLoginAlert.addAction(okayButtonAction)
    present(failedLoginAlert, animated: true, completion: nil)
  }
}
