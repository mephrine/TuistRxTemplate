import Foundation
import ProjectDescription

// MARK: Extension
extension TargetDependency {
  public struct Project {
    public struct Feature {
      public struct Login {}
    }
    public struct Module {}
    public struct Network {}
    public struct UserInterface {}
  }
}

public extension TargetDependency.Project.Feature {
  static let Features: [TargetDependency] = [
    TargetDependency.Project.Feature.Login.Package
  ].flatMap { $0 }
  
  struct BaseDependencyKit {
    public static let Data = TargetDependency.data(name: "BaseDependencyKit")
    public static let Domain = TargetDependency.domain(name: "BaseDependencyKit")
    public static let Presentation = TargetDependency.presentation(name: "BaseDependencyKit")
    public static let Package: [TargetDependency] = [Data, Domain, Presentation]
  }
  
  struct Base {
    public static let Data = TargetDependency.data(name: "Base")
    public static let Domain = TargetDependency.domain(name: "Base")
    public static let Presentation = TargetDependency.presentation(name: "Base")
  }
}

public extension TargetDependency.Project.UserInterface {
  static let DesignSystem = TargetDependency.userInterface(name: "DesignSystem")
	static let LocalizableStringManager = TargetDependency.userInterface(name: "LocalizableStringManager")
 static let UserInterfaceLibraryManager = TargetDependency.userInterface(name: "UserInterfaceLibraryManager")
}

public extension TargetDependency.Project.Module {
  static let CoreKit = TargetDependency.module(name: "CoreKit")
  static let DevelopTool = TargetDependency.module(name: "DevelopTool")
  static let GlobalManager = TargetDependency.module(name: "GlobalManager")
  static let RxPackage = TargetDependency.module(name: "RxPackage")
  static let ThirdPartyDynamicLibraryPluginManager = TargetDependency.module(name: "ThirdPartyDynamicLibraryPluginManager")
  static let ThirdPartyLibraryManager = TargetDependency.module(name: "ThirdPartyLibraryManager")
  static let UtilityKit = TargetDependency.module(name: "UtilityKit")
  static let InjectManager = TargetDependency.module(name: "InjectManager")
}

public extension TargetDependency.Project.Network {
  static let Service = TargetDependency.network(name: "NetworkService")
  static let APIKit = TargetDependency.network(name: "NetworkAPIKit")
}

public extension TargetDependency.Project.Feature.Login {
  static let Data = TargetDependency.data(name: "Login")
  static let Domain = TargetDependency.domain(name: "Login")
  static let Presentation = TargetDependency.presentation(name: "Login")
  static let Package: [TargetDependency] = [Data, Domain, Presentation]
}
