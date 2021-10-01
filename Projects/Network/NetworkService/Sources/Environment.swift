//
//  Environment.swift
//  NetworkService
//
//  Created by Mephrine on 2021/09/27.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation

enum Environment {
  // MARK: - Keys
  enum Keys {
    static let apiURL = "ApiURL"
    static let socketURL = "SocketURL"
    static let version = "CFBundleShortVersionString"
    static let buildNumber = "CFBundleVersion"
  }

  // MARK: - Plist
  private static let infoDictionary: [String: Any] = {
    guard let info = Bundle.main.infoDictionary else {
      fatalError("NetworkService.plist file not found")
    }
    return info
  }()

  // MARK: - Values
  static let apiURL: URL = {
    guard let urlString = Environment.infoDictionary[Keys.apiURL] as? String else {
      fatalError("apiURL not set in plist for this environment")
    }
    guard let url = URL(string: urlString) else {
      fatalError("apiURL is invalid")
    }
    return url
  }()

  static let socketURL: URL = {
    guard let urlString = Environment.infoDictionary[Keys.socketURL] as? String else {
      fatalError("socketURL not set in plist for this environment")
    }
    guard let url = URL(string: urlString) else {
      fatalError("socketURLL is invalid")
    }
    return url
  }()

  static let version: String = {
    guard let version = Environment.infoDictionary[Keys.version] as? String else {
      fatalError("Version not set in plist for this environment")
    }
    return version
  }()

  static let buildNumber: String = {
    guard let build = Environment.infoDictionary[Keys.buildNumber] as? String else {
      fatalError("BuildNumber not set in plist for this environment")
    }
    return build
  }()
}
