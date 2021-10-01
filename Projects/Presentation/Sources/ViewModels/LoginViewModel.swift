import Foundation
import RxSwift
import RxCocoa
import RxFlow
import UtilityKit
import Domain
import InjectPropertyWrapper
import Logger

public final class LoginViewModel: ViewActionTransformable, HasDisposeBag, Stepper {
  // MARK: - Action
  public struct Action {
    var viewWillAppear: Observable<Void>
    var typeedIDTextField: Observable<String>
    var typedPasswordTextField: Observable<String>
    var tappedLoginButton: Observable<(String, String)>
  }

  // MARK: - State
  public struct State {
    var cachingLoginID: Driver<String>
    var enableLoginButton: Driver<Bool>
    var login: Driver<Result<User, Error>>
  }

  // MARK: - Inject
  @Inject private var getLoginUser: GetLoginUser
  @Inject private var getCachingLoginID: GetCachingLoginID

  // MARK: - Properties
  public var steps = PublishRelay<Step>()
  var disposeBag = DisposeBag()
  private let id = BehaviorSubject<String>(value: "")
  private let password = BehaviorSubject<String>(value: "")

  // MARK: - Initialize
  public init() {}
}

// MARK: - Transformation
extension LoginViewModel {
  public func transform(action: Action) -> State {
    let cachingLoginID = action.viewWillAppear
      .observe(on: ConcurrentDispatchQueueScheduler.init(qos: .utility))
      .withUnretained(self)
      .flatMap { owner, _ -> Observable<String> in
        owner.requestCachingLoginID()
      }
      .asDriver(onErrorJustReturn: "")

    let loginButtonEnabled = Observable.combineLatest(
        action.typeedIDTextField,
        action.typedPasswordTextField,
        resultSelector: { ($0, $1) }
      )
      .map(validation)
      .asDriver(onErrorJustReturn: false)

    let login = action.tappedLoginButton
      .observe(on: ConcurrentDispatchQueueScheduler.init(qos: .utility))
      .withUnretained(self)
      .flatMap { owner, parameters -> Observable<Result<User, Error>> in
        owner.requestLogin(loginID: parameters.0, password: parameters.1)
      }
      .asDriver(onErrorJustReturn: .failure(NetworkError.serverFailure))

    action.typeedIDTextField
      .ifEmpty(default: "")
      .bind(to: id)
      .disposed(by: disposeBag)

    action.typedPasswordTextField
      .bind(to: password)
      .disposed(by: disposeBag)

    return State(cachingLoginID: cachingLoginID, enableLoginButton: loginButtonEnabled, login: login)
  }
}

// MARK: - UseCase
extension LoginViewModel {
  private func requestCachingLoginID() -> Observable<String> {
    getCachingLoginID.call(params: Void())
      .catchAndReturn("")
      .asObservable()
  }

  private func requestLogin(loginID: String, password: String) -> Observable<Result<User, Error>> {
    getLoginUser.call(params: GetLoginUser.Params(loginID: loginID, password: password))
      .asObservable()
      .materialize()
      .map { event -> Event<Result<User, Error>> in
        switch event {
        case .error(let error):
          return .next(.failure(error))
        default:
          return event.map { .success($0) }
        }
      }
      .dematerialize()
      .catchAndReturn(.failure(NetworkError.serverFailure))
  }
}

// MARK: - Route
extension LoginViewModel {
  public func routeToMain(userName: String) {
    steps.accept(AppStep.goToMain(userName: userName))
  }
}

// MARK: - Function
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
