// ___FILEHEADER___

import RxFlow
import RxPackage
import UIKit
import UtilityKit

class ___VARIABLE_productName___Flow: Flow {
  var root: Presentable {
    return self.rootViewController
  }

  private lazy var rootViewController: UINavigationController = {
    let viewController = UINavigationController()
    viewController.setNavigationBarHidden(true, animated: false)
    return viewController
  }()

  init() {
  }

  deinit {
    Logger.d("deinit MainFlow")
  }

  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppStep else {
        return .none
    }

    switch step {
    }
  }
}
