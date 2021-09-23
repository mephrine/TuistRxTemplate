//
//  Reusable.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

// Reference: RIBsReactorKit

import UIKit

public protocol Reusable {
  static var identifier: String { get }
}

extension Reusable {
  static var identifier: String {
    String(describing: Self.self)
  }
}
