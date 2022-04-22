//
//  LoginLocalDataSource.swift
//  Data
//
//  Created by Mephrine on 2021/09/27.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation
import Then
import RxSwift
import UtilityKit

public protocol LoginLocalDataSource {
  func saveUserID(loginID: String)
  func lastLoggedInUserID() -> Single<String>
}

public struct LoginLocalDataSourceImpl: LoginLocalDataSource {
  // MARK: - Initialize
  public init() {}

  // MARK: - Implementation
  public func saveUserID(loginID: String) {
    UserDefaults.standard.do {
      $0.set(loginID, forKey: UserDefaultsKeys.loginID)
      $0.synchronize()
    }
  }

  public func lastLoggedInUserID() -> Single<String> {
    Single<String>.create { single in
      let cachingLoginId = UserDefaults.standard.string(forKey: UserDefaultsKeys.loginID)
      if let cachingLoginId = cachingLoginId {
        single(.success(cachingLoginId))
      } else {
        single(.failure(LoginError.noCachingLoginID))
      }
      return Disposables.create()
    }
  }
}
