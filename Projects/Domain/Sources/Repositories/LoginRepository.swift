import Foundation
import RxSwift

public protocol LoginRepository {
  func requestLoginUser(_ loginID: String, _ password: String) -> Single<User>
  func requestCachingLoginId() -> Single<String>
}
