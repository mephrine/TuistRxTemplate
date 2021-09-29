import UIKit
import RxFlow
import RxSwift
import Logger
import Presentation
import Reachability

// MARK: - AppDelegate
final class AppDelegate: UIResponder, UIApplicationDelegate {
  // MARK: - Properties
  var window: UIWindow?
  var coordinator = FlowCoordinator()
  var disposeBag = DisposeBag()
  private var reachability: Reachability?
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    setReachability()
    PrepareAppDelegate().load()
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    prepareNavigation()
    //    let launchRouter = RootBuilder(dependency: AppComponent()).build()
    //    self.launchRouter = launchRouter
    //    launchRouter.launch(from: window)
#if DEBUG
    PrepareDevelopToolService().load()
#endif
    return true
  }
  private func prepareNavigation() {
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
}
