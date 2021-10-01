import UIKit
import RxRelay
import RxFlow
import Logger

public final class AppFlow: Flow {
  public var root: Presentable {
    return self.rootViewController
  }

  private lazy var rootViewController: UINavigationController = {
    let viewController = UINavigationController()
    viewController.setNavigationBarHidden(true, animated: false)
    return viewController
  }()

  public init() {
  }

  deinit {
    Logger.d("deinit AppFlow")
  }

  public func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppStep else { return .none }

    switch step {
    case .initApp:
      return self.routerToLogin()
    case .goToMain(let userName):
      return self.routerToMain(userName)
    default:
      return .none
    }
  }

  private func routerToLogin() -> FlowContributors {
    let loginViewController = LoginViewController()
    self.rootViewController.setViewControllers([loginViewController], animated: false)

    return .one(flowContributor: FlowContributor.contribute(withNextPresentable: loginViewController, withNextStepper: loginViewController.viewModel))
  }

  private func routerToMain(_ userName: String) -> FlowContributors {
    let mainFlow = MainFlow()
    Flows.use(mainFlow, when: .created) { [unowned self] root in
      DispatchQueue.main.async { [unowned root] in
        root.modalPresentationStyle = .fullScreen
        self.rootViewController.present(root, animated: true)
      }
    }
    return .one(flowContributor: FlowContributor.contribute(withNextPresentable: mainFlow, withNextStepper: OneStepper(withSingleStep: AppStep.goToMain(userName: userName))))
  }
}

public final class AppStepper: Stepper {
  public let steps = PublishRelay<Step>()

  public init() {
  }

  public var initialStep: Step {
    return AppStep.initApp
  }

  public func readyToEmitSteps() {

  }
}
