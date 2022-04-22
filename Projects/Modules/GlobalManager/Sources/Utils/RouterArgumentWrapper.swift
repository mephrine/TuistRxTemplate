//
//  RouterArgumentWrapper.swift
//  GlobalManager
//
//  Created by Mephrine on 2022/04/05.
//  Copyright © 2022 deepfine. All rights reserved.
//

import Foundation

public struct RouterArgumentWrapper {
  private let value: Any

  public init(value : Any) {
    self.value = value
  }

  func unwrap<T>() -> T? {
    guard let unwrappedValue = value as? T else { return nil }
    return unwrappedValue
  }
}
