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
    static let apiURL = "API_URL"
    static let socketURL = "SOCKET_URL"
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
      fatalError("API_URL not set in plist for this environment")
    }
    guard let url = URL(string: urlString) else {
      fatalError("API_URL is invalid")
    }
    return url
  }()
  
  static let socketURL: URL = {
    guard let urlString = Environment.infoDictionary[Keys.socketURL] as? String else {
      fatalError("SOCKET_URL not set in plist for this environment")
    }
    guard let url = URL(string: urlString) else {
      fatalError("SOCKET_URL is invalid")
    }
    return url
  }()
}
