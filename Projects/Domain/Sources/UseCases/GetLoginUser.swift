import Foundation
import RxPackage

public struct GetLoginUser: UseCase {
  typealias ReturnType = User
  
  struct Params {
    let loginId: String
    let password: String
  }
  
  func execute(params: Params) -> Single<User> {
    
  }
  
  public init() {}
}
