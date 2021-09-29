import Foundation
import RxSwift
import RxCocoa
import RxFlow
import UtilityKit
import Domain

public final class LoginViewModel: ViewActionTransformable, HasDisposeBag, Stepper {
  // MARK: - Action
  public struct Action {
    var typeedIDTextField: Observable<String?>
    var typedPassWordTextField: Observable<String?>
    var tappedLoginButton: Observable<(String?, String?)>
  }
  
  // MARK: - State
  public struct State {
    var loginButtonEnabled: Driver<Bool>
    var loginSuccess: Driver<User>
  }
  
  // MARK: - Properties
  public var steps: PublishRelay<Step>
  public var disposeBag = DisposeBag()
  
  private let id = BehaviorSubject<String>(value: "")
  private let password = BehaviorSubject<String>(value: "")
  
  // MARK: - Initialize
  public init() {}
  
  // MARK: - Transformation
  public func transform(action: Action) -> State {
    let idText = action.typeedIDTextField
      .withUnretained(self)
      .do(onNext: { owner, value in
        guard let idValue = value else { return }
        owner.id.onNext(idValue)
      })
        
    let passwordText = action.typedPassWordTextField
      .withUnretained(self)
      .do(onNext: { owner, value in
        guard let idValue = value else { return }
        owner.password.onNext(idValue)
      })
          
    let loginButtonEnabled = Observable.combineLatest(
      idText, passwordText
    ).map(validation)
    .asDriver(onErrorJustReturn: false)
          
    let loginSuccess = requestLogin(inputData: action.tappedLoginButton)
    return State(loginButtonEnabled: loginButtonEnabled, loginSuccess: loginSuccess)
  }
}

extension LoginViewModel {
  private func requestLogin(inputData loginInfo: Observable<(String?, String?)>) -> Driver<User> {
    //    getLoginUser.login(withEmail: email, password: password)
    //      .observe(on: ConcurrentDispatchQueueScheduler.init(qos: .default))
    //      .subscribe { result in
    //        self.listener?.login()
    //      } onError: { error in
    //        self.presenter.failedLogin(error: LoginError.invalidUserInformation)
    //      }.disposed(by: disposeBag)
  }
}

extension LoginViewModel {
  private func validation(id: String?, password: String?) -> Bool {
    id?.isEmpty == false && password?.isEmpty == false
  }
  
  private func verify(email: String?) -> Bool {
    let emailRegularExpression = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
    return email.isValid(regex: emailRegularExpression)
  }
  
  private func verify(password: String?) -> Bool {
    let passwordRegularExpression = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,16}$"
    return password.isValid(regex: passwordRegularExpression)
  }
}


fileprivate extension Optional where Wrapped == String {
  func isValid(regex: String) -> Bool {
    guard let `self` = self else { return false }
    
    let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
    return predicate.evaluate(with: self)
  }
}
