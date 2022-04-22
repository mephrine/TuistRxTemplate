//
//  SkeletonControllable.swift
//  Presentation
//
//  Created by Mephrine on 2021/12/02.
//  Copyright © 2021 deepfine. All rights reserved.
//

import SkeletonView
import UIKit

// MARK: - SkeletonControllable
protocol SkeletonControllable {
  func skeletonView(_ contentsView: UIView, shouldStartAnimationWhen needAnimation: Bool)
}

extension SkeletonControllable {
  func skeletonView(_ contentsView: UIView, shouldStartAnimationWhen needAnimation: Bool) {
    DispatchQueue.main.async { [weak contentsView] in
      if needAnimation {
        contentsView?.showAnimatedGradientSkeleton()
      } else {
        contentsView?.hideSkeleton()
      }
    }
  }
}
