//
//  Bindable.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation

public protocol Bindable: HasViewModel {
  func bindActions()
  func bindState(from viewModel: ViewModel)
}
