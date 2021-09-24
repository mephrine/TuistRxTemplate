//
//  InjectViewModel.swift
//  RepositoryInjectManager
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Swinject
import InjectPropertyWrapper
import ThirdPartyLibraryManager
import FeatureLoginPresentation

public struct InjectViewModel {
  public init() {}
  
  public func register() {
    let container = InjectContainer.container
    container.register(LoginViewModel.self) { _ in
      LoginViewModel()
    }
  }
}
