//
//  GetCachingLoginID.swift
//  Domain
//
//  Created by Mephrine on 2021/09/28.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation
import RxSwift
import InjectPropertyWrapper

public struct GetCachingLoginID: UseCase {
  // MARK: - Parameters
  public typealias Params = Void

  // MARK: - Inject
  @Inject private var repository: LoginRepository

  // MARK: - Initialize
  public init() {}

  // MARK: - Implementation
  public func call(params: Void) -> Single<String> {
    repository.requestCachingLoginId()
  }
}
