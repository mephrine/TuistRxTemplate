import UIKit
import RxFlow
import RxSwift
import ThirdPartyLibraryManager
import Logger
import Presentation

// MARK: - AppDelegate
final class AppDelegate: UIResponder, UIApplicationDelegate {
  // MARK: - Properties
  var window: UIWindow?
  
  var coordinator = FlowCoordinator()
  var disposeBag = DisposeBag()
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    
    PrepareAppDelegateService().load()
    
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
    Flows.whenReady(flow1: appFlow) { [unowned self] root in
      window?.rootViewController = root
      window?.makeKeyAndVisible()
    }
  }
}
