//
//  LoggedInUser.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/10/28.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation
import UtilityKit

public final class LoggedInUser {
	public static let shared = LoggedInUser()
	
	public func login(loggedInUser: LoginInfo) {
		user = loggedInUser
	}
	
	public func logout() {
		user = nil
	}
	
	public var user: LoginInfo? = nil
	
	private init() { }
}

public struct LoginInfo: Encodable {
  public let corpID: String
  public let email: String
  public let groupID: String
  public let groupName: String
  public let jobName: String
  public let loginID: String
  public let loginKey: String
  public let name: String
  public var profilePhoto: String
  public var status: String
  public let type: String
  public let canUseFlash: String
  public let glassType: String
  public let systemYn: String
  public let rootGroupID: String
  public let isInitializedPassword: Bool
  
  enum CodingKeys: String, CodingKey {
    case corpID = "corp_id"
    case email
    case groupID = "group_id"
    case groupName = "group_name"
    case jobName = "job_name"
    case loginID = "login_id"
    case loginKey = "login_key"
    case name
    case profilePhoto = "profile_photo"
    case status
    case type
    case canUseFlash = "use_flash_yn"
    case glassType = "glass_type"
    case systemYn = "system_yn"
    case rootGroupID = "root_group_id"
    case isInitializedPassword = "pw_init"
  }

  public init(corpID: String, email: String, groupID: String, groupName: String, jobName: String, loginID: String, loginKey: String, name: String, profilePhoto: String, status: String, canUseFlash: String, glassType: String, systemYn: String, rootGroupID: String, isInitializedPassword: Bool) {
    self.corpID = corpID
    self.email = email
    self.groupID = groupID
    self.groupName = groupName
    self.jobName = jobName
    self.loginID = loginID
    self.loginKey = loginKey
    self.name = name
    self.profilePhoto = profilePhoto
    self.status = status
    self.type = "M"
    self.canUseFlash = canUseFlash
    self.glassType = glassType
    self.systemYn = systemYn
    self.rootGroupID = rootGroupID
    self.isInitializedPassword = isInitializedPassword
  }
  
  public static func empty() -> Self {
    return LoginInfo.init(corpID: "", email: "", groupID: "", groupName: "", jobName: "", loginID: "", loginKey: "", name: "", profilePhoto: "", status: "", canUseFlash: "", glassType: "", systemYn: "", rootGroupID: "", isInitializedPassword: false)
  }
	
	public var profileURL: URL {
		Environment.socketURL.appendingPathComponent(profilePhoto)
	}
}
