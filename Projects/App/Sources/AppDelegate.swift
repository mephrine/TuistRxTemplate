import UIKit
import RxPackage
import ThirdPartyLibraryManager
import ThirdPartyDynamicLibraryPluginManager


// MARK: - AppDelegate
@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
  // MARK: - Properties
  var window: UIWindow?
  
  func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
      
      PrepareAppDelegateService().load()
      
      let window = UIWindow(frame: UIScreen.main.bounds)
      self.window = window
      
      let launchRouter = RootBuilder(dependency: AppComponent()).build()
      self.launchRouter = launchRouter
      launchRouter.launch(from: window)
      
      #if DEBUG
      PrepareDevelopToolService().load()
      #endif
      

      return true
  }
}
