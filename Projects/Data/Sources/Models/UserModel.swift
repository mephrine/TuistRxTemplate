import Foundation
import Domain

public struct UserModel: Decodable {
  var name: String = "Unknown"
  
  func toEntity() -> User {
    User(name: name)
  }
  
  static func empty() -> Self {
    UserModel()
  }
}
