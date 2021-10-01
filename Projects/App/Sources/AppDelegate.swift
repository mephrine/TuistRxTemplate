import UIKit
import RxPackage
import RxFlow
import RxSwift
import Logger
import Presentation
import Reachability
import InjectManager

// MARK: - AppDelegate
final class AppDelegate: UIResponder, UIApplicationDelegate {
  // MARK: - Properties
  var window: UIWindow?
  var coordinator = FlowCoordinator()
  var disposeBag = DisposeBag()
  private var reachability: Reachability?
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    setReachability()
    registerInjection()
    prepareNavigation()
#if DEBUG
    PrepareDevelopToolService().load()
#endif
    return true
  }
  
  private func prepareNavigation() {
    self.window = UIWindow(frame: UIScreen.main.bounds)

    coordinator.rx.didNavigate
      .subscribe(onNext: { flow, step in
        Logger.d("did navigate to flow : \(flow), step : \(step)")
      }).disposed(by: disposeBag)
    
    let appFlow = AppFlow()
    self.coordinator.coordinate(flow: appFlow, with: AppStepper())
    
    Flows.use(appFlow, when: .created) { [unowned self] root in
      self.window?.rootViewController = root
      self.window?.makeKeyAndVisible()
    }
  }
}

private extension AppDelegate {
  func setReachability() {
    do {
      reachability = try Reachability()
      try reachability?.startNotifier()
    } catch {
      Logger.e(error)
    }
  }

  func registerInjection() {
    InjectService().register()
    InjectDataSource().register()
    InjectRepository().register()
    InjectUseCase().register()
    InjectViewModel().register()
  }
}
