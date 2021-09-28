//
//  MainFlow.swift
//  Presentation
//
//  Created by Mephrine on 2021/09/24.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation
import RxPackage
import RxPresentation


class MainFlow: Flow {
  var root: Presentable {
    return self.rootViewController
  }
  
  private lazy var rootViewController: BaseNavigationController = {
    let viewController = BaseNavigationController()
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
    case .goMain:
      return routerToMain()
    default:
      return .none
    }
  }
  
  private func routerToMain() -> FlowContributors {
    let mainViewController = MainViewController()
    self.rootViewController.setViewControllers([mainViewController], animated: false)
    
    return .one(flowContributor: FlowContributor.contribute(withNextPresentable: mainViewController, withNextStepper: mainViewModel.viewModel))
  }
}

