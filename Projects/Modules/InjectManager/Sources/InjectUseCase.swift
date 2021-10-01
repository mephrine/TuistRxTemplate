//
//  InjectUseCase.swift
//  RepositoryInjectManager
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Swinject
import InjectPropertyWrapper
import ThirdPartyLibraryManager
import Domain

public struct InjectUseCase {
  public init() {}

  public func register() {
    let container = InjectContainer.container
    container.register(GetLoginUser.self) { _ in
      GetLoginUser()
    }
    container.register(GetCachingLoginID.self) { _ in
      GetCachingLoginID()
    }
  }
}
