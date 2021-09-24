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
    viewController.setNavigationBarHidden(true, animated: false)
    return viewController
  }()
  
  private let service: AppServices
  
  init(service: AppServices) {
    self.service = service
  }
  
  deinit {
    Logger.d("deinit MainFlow")
  }
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppStep else { return .none }
    
    switch step {
    case .goMain:
      return naviToMain()
    default:
      return .none
    }
  }
  
  private func naviToMain() -> FlowContributors {
    let mainVC = MainVC.instantiate(withViewModel: MainVM(), storyBoardName: "Main")
    self.rootViewController.setViewControllers([mainVC], animated: false)
    
    return .one(flowContributor: FlowContributor.contribute(withNextPresentable: mainVC, withNextStepper: mainVC))
  }
}

