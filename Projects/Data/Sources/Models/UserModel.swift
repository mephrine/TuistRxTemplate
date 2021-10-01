import Foundation
import Domain

public struct UserModel: Decodable {
  let corpId: String
  let email: String?
  let groupId: String
  let groupName: String
  let jobName: String?
  let loginId: String
  let loginKey: String
  let name: String
  let profilePhoto: String?
  let roomId: String?
  let roomKey: String?
  let status: String?
  let type: String?
  let useFlashYn: String?
  let glassType: String?
  let systemYn: String
  let rootGroupId: String
  let pwInit: Bool
}

extension UserModel {
  func toEntity() -> User {
    User(name: name)
  }

  static func empty() -> Self {
    UserModel(corpId: "", email: "", groupId: "", groupName: "", jobName: "", loginId: "", loginKey: "", name: "", profilePhoto: "", roomId: "", roomKey: "", status: "", type: "", useFlashYn: "", glassType: "", systemYn: "", rootGroupId: "", pwInit: false)
  }
}
