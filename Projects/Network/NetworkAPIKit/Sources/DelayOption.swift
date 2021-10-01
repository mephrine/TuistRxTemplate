//
//  DelayOption.swift
//  NetworkAPIKit
//
//  Created by Mephrine on 2021/09/27.
//  Copyright © 2021 deepfine. All rights reserved.
//
// Refrence: RIBsReactorKit

import Foundation
import RxSwift

public enum DelayOption {
  case immediate
  case constant(time: Double)
  case exponential(initial: Double, multiplier: Double, maxDelay: Double = 32)
  case custom(closure: (Int) -> Double)
}

extension DelayOption {
  func makeTimeInterval(_ attempt: Int) -> RxTimeInterval {
    var interval: Double {
      switch self {
      case .immediate:
        return 0.0

      case let .constant(time):
        return time

      case let .exponential(initial, multiplier, maxDelay):
        var delay: Double {
          guard attempt > 1 else { return 1 }
          return initial * pow(multiplier, Double(attempt))
        }

        let delayValue = min(maxDelay, delay)
        let fullJitter = Double.random(in: 0...delayValue)
        return delayValue + fullJitter

      case let .custom(closure):
        return closure(attempt)
      }
    }

    return .milliseconds(Int(interval * 1000))
  }
}
