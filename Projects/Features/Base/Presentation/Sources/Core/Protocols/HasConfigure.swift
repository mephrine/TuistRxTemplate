//
//  HasConfigure.swift
//  Presentation
//
//  Created by Mephrine on 2021/12/10.
//  Copyright © 2021 benz. All rights reserved.
//

import Foundation

public protocol HasConfigure {
  associatedtype ViewModel
  func configure(by viewModel: ViewModel)
}
