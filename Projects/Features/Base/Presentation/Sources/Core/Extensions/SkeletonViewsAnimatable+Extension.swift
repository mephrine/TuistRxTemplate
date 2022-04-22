//
//  SkeletonViewsAnimatable.swift
//  Presentation
//
//  Created by Mephrine on 2021/12/02.
//  Copyright © 2021 deepfine. All rights reserved.
//

import SkeletonView
import UIKit

// MARK: - SkeletonViewsAnimatable
public protocol SkeletonViewsAnimatable {
  var skeletonViews: [UIView] { get }

  func showSkeletonAnimation()
  func hideSkeletonAnimation()
}

public extension SkeletonViewsAnimatable {
  func showSkeletonAnimation() {
    skeletonViews.forEach { $0.showAnimatedGradientSkeleton() }
  }

  func hideSkeletonAnimation() {
    skeletonViews
      .filter(\.sk.isSkeletonActive)
      .forEach { $0.hideSkeleton(transition: .crossDissolve(0.25)) }
  }
}
