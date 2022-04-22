//
//  HasSetupConstraints.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

// Refrence: RIBsReactorKit

import Foundation

protocol HasSetupConstraints {
  var didSetupConstraints: Bool { get }

  /**
   Override this method, if need to set Autolayout constraints

   Do not call `setNeedsUpdateConstraints()` inside your implementation.
   Calling `setNeedsUpdateConstraints()` schedules another update pass, creating a feedback loop.

   Do not call `setNeedsLayout()`, `layoutIfNeeded()`, `setNeedsDisplay()` in this method
   */
  func setupConstraints()
}
