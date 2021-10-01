//
//  LoginService.swift
//  Data
//
//  Created by Mephrine on 2021/09/27.
//  Copyright © 2021 deepfine. All rights reserved.
//
import Foundation
import Moya

// MARK: - LoginService
public enum LoginService: TargetType {
  case login(loginID: String, password: String)
}

// MARK: - TargetType
extension LoginService {
  public var baseURL: URL {
    Environment.apiURL
  }

  public var path: String {
    switch self {
    case .login:
      return "/api/v1/login/mobile_login"
    }
  }

  public var method: Moya.Method {
    switch self {
    default:
      return .get
    }
  }

  public var sampleData: Data {
    LoginFixture.data
  }

  public var task: Task {
    switch self {
    case let .login(loginID, password):
      return .requestParameters(
        parameters: ["login_id": loginID, "login_pw": password, "corp_uid": "deepfine-ai"],
        encoding: URLEncoding.default
      )
    }
  }

  public var headers: [String: String]? {
    [
      "Content-Type": "application/json; charset=utf-8",
      "app-version": Environment.version,
      "app-version-code": Environment.buildNumber
    ]
  }
}
