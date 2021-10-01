//
//  InjectService.swift
//  RepositoryInjectManager
//
//  Created by Mephrine on 2021/09/27.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Swinject
import InjectPropertyWrapper
import ThirdPartyLibraryManager
import NetworkAPIKit
import NetworkService

public struct InjectService {
  public init() {}

  public func register() {
    let container = InjectContainer.container

    container.register(NetworkAPIKit.Networking<LoginService>.self) { _ in
      Networking<LoginService>()
    }
  }
}
