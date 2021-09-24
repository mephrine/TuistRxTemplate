import Foundation
import RxSwift
import RxCocoa
import UtilityKit
import Domain

public final class LoginViewModel: ViewActionTransformable, HasDisposeBag {
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
  public var disposeBag = DisposeBag()
  private let id = BehaviorSubject<String>(value: "")
  private let password = BehaviorSubject<String>(value: "")
  
  // MARK: - Initialize
  public init() {}
  
  // MARK: - Transformation
  public func transform(action: Action) -> State {
    let idText = action.typeedIDTextField
      .do(onNext: { [weak self] value in
        guard let self = self, let idValue = value else { return }
        self.id.onNext(idValue)
      })
        
        let passwordText = action.typedPassWordTextField
        .do(onNext: { [weak self] value in
          guard let self = self, let idValue = value else { return }
          self.password.onNext(idValue)
        })
          
          let loginButtonEnabled = Observable.combineLatest(
            idText, passwordText
          ).map(validation)
          .asDriver(onErrorJustReturn: false)
          
          let loginSuccess = requestLogin(inputData: action.tappedLoginButton)
          return State(loginButtonEnabled: loginButtonEnabled, loginSuccess: loginSuccess)
          }
  
  private func validation(id: String?, password: String?) -> Bool {
    id?.isEmpty == false && password?.isEmpty == false
  }
  
  private func requestLogin(inputData loginInfo: Observable<(String?, String?)>) -> Driver<User> {
    
  }
}
