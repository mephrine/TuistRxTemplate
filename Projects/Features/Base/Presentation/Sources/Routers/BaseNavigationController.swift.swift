//
//  BaseNavigationController.swift.swift
//  BasePresentation
//
//  Created by Mephrine on 2022/01/24.
//  Copyright © 2022 deepfine. All rights reserved.
//

import UIKit

public final class BaseNavigationController: UINavigationController {
  private var duringTransition = false
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    self.interactivePopGestureRecognizer?.delegate = self
    self.delegate = self
  }
  
  public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    duringTransition = true
    super.pushViewController(viewController, animated: animated)
  }
}

extension BaseNavigationController: UINavigationControllerDelegate {
  public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
    self.duringTransition = false
  }
}

extension BaseNavigationController: UIGestureRecognizerDelegate {
  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    guard gestureRecognizer == interactivePopGestureRecognizer
    else { return true }
    
    return viewControllers.count > 1 && duringTransition == false
  }
}
