import UIKit
import RxRelay
import RxFlow
import Logger

class AppFlow: Flow {
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
    Logger.d("deinit AppFlow")
  }
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppStep else { return .none }
    
    switch step {
    case .initApp:
      return self.routerToLogin()
//    case .goMain:
//      return self.routerToMain()
    default:
      return .none
    }
  }
  
  
  private func routerToLogin() -> FlowContributors {
    let loginViewController = LoginViewController()
    let loginViewModel = LoginViewModel()
    self.rootViewController.setViewControllers([loginViewController], animated: false)
    
    return .one(flowContributor: FlowContributor.contribute(withNextPresentable: loginViewController, withNextStepper: loginViewModel))
  }
  
  // MainFlow로 이동하기.
//  private func routerToMain() -> FlowContributors {
//    let mainFlow = MainFlow(service: self.service)
//    Flows.whenReady(flow1: mainFlow) { [unowned self] root in
//      Async.main {
//        root.modalPresentationStyle = .fullScreen
//        self.rootViewController.present(root, animated: ANIMATION_ROOT_TRANSITION)
//      }
//    }
//    return .one(flowContributor: FlowContributor.contribute(withNextPresentable: mainFlow, withNextStepper: OneStepper(withSingleStep: AppStep.goMain)))
//  }
}

class AppStepper: Stepper {
  let steps = PublishRelay<Step>()
  
  init() {
  }
  
  var initialStep: Step {
    return AppStep.initApp
  }
  
  func readyToEmitSteps() {
    
  }
}
