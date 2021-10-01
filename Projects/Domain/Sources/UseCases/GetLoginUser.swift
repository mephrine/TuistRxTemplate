import Foundation
import RxSwift
import InjectPropertyWrapper

public struct GetLoginUser: UseCase {
  // MARK: - Parameters
  public struct Params {
    let loginID: String
    let password: String

    public init(loginID: String, password: String) {
      self.loginID = loginID
      self.password = password
    }
  }

  // MARK: - Inject
  @Inject private var repository: LoginRepository

  // MARK: - Initialize
  public init() {}

  // MARK: - Implementation
  public func call(params: Params) -> Single<User> {
    repository.requestLoginUser(params.loginID, params.password)
  }
}
