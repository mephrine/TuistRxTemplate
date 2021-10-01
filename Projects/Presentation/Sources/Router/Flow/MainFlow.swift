//
//  MainFlow.swift
//  Presentation
//
//  Created by Mephrine on 2021/09/24.
//  Copyright © 2021 deepfine. All rights reserved.
//

import UIKit
import RxPackage
import RxFlow
import Logger

class MainFlow: Flow {
  var root: Presentable {
    return self.rootViewController
  }

  private lazy var rootViewController: UINavigationController = {
    let viewController = UINavigationController()
    viewController.setNavigationBarHidden(false, animated: false)
    return viewController
  }()

  init() {}

  deinit {
    Logger.d("deinit MainFlow")
  }

  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppStep else { return .none }

    switch step {
    case .goToMain(let userName):
      return initMainFlow(userName)
    case .backToLogin:
      return routerToGoBackLogin()
    default:
      return .none
    }
  }
  
  private func initMainFlow(_ userName: String) -> FlowContributors {
    let mainViewController = MainViewController(userName: userName)
    self.rootViewController.setViewControllers([mainViewController], animated: false)
    
    return .one(flowContributor: FlowContributor.contribute(withNextPresentable: mainViewController, withNextStepper: mainViewController.viewModel, allowStepWhenDismissed: true))
  }

  private func routerToGoBackLogin() -> FlowContributors {
    self.rootViewController.dismiss(animated: true, completion: nil)

    return .none
  }
}
