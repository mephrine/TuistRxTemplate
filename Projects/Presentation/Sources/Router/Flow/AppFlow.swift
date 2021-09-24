import Foundation
import RxPackage
import RxPresentation

class AppFlow: Flow {
  var root: Presentable {
    return self.rootViewController
  }
  
  private lazy var rootViewController: UINavigationController = {
    let viewController = UINavigationController()
    viewController.setNavigationBarHidden(true, animated: false)
    return viewController
  }()
  
  private let service: AppServices
  
  init(service: AppServices) {
    self.service = service
  }
  
  deinit {
    Logger.debug("deinit AppFlow")
  }
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppStep else { return .none }
    
    switch step {
    case .initApp:
      return self.naviToIntro()
    case .goMain:
      return self.naviToMainScene()
    default:
      return .none
    }
  }
  
  // 인트로 화면으로 이동.
  private func naviToIntro() -> FlowContributors {
    let introVC = IntroVC.instantiate(withViewModel: IntroVM(withService: service), storyBoardName: "Intro")
    self.rootViewController.setViewControllers([introVC], animated: false)
    
    return .one(flowContributor: FlowContributor.contribute(withNextPresentable: introVC, withNextStepper: introVC))
  }
  
  // MainFlow로 이동하기.
  private func naviToMainScene() -> FlowContributors {
    let mainFlow = MainFlow(service: self.service)
    Flows.whenReady(flow1: mainFlow) { [unowned self] root in
      Async.main {
        root.modalPresentationStyle = .fullScreen
        self.rootViewController.present(root, animated: ANIMATION_ROOT_TRANSITION)
      }
    }
    return .one(flowContributor: FlowContributor.contribute(withNextPresentable: mainFlow, withNextStepper: OneStepper(withSingleStep: AppStep.goMain)))
  }
}

/**
 # (C) AppStepper
 - Author: Mephrine
 - Date: 19.12.03
 - Note: 첫 Flow 실행을 위한 Stepper
 */
class AppStepper: Stepper {
  let steps = PublishRelay<Step>()
  private let appServices: AppServices
  
  init(withService service: AppServices) {
    self.appServices = service
  }
  
  var initialStep: Step {
    return AppStep.initApp
  }
  
  // FlowCoordinator가 Flow에 기여하기 위해 청취할 준비가 되면 step을 한번 방출하는데 사용되어지는 callback.
  func readyToEmitSteps() {
    
  }
}
