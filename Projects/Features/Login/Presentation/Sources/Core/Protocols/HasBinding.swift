//
//  HasBinding.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation

protocol HasBinding: HasViewModel {
  func onBind(by viewModel: ViewModel)
}
