import Foundation
import ProjectDescription

// MARK: Extension
//extension TargetDependency {
//  public struct Project {
//    public struct Feature {
//      public struct Login {}
//    }
//    public struct Core {}
//    public struct Module {}
//    public struct UserInterface {}
//  }
//}
//
//public extension TargetDependency.Project.Feature {
//  static let Features = TargetDependency.feature(name: "Features")
//
//  struct BaseDependency {
//    public static let Data = TargetDependency.data(feature: "BaseDependency")
//    public static let Domain = TargetDependency.domain(feature: "BaseDependency")
//    public static let Presentation = TargetDependency.presentation(feature: "BaseDependency")
//  }
//}
//
//public extension TargetDependency.Project.Feature.Login {
//  static let Data = TargetDependency.data(feature: String(describing: Self.self))
//  static let Domain = TargetDependency.domain(feature: String(describing: Self.self))
//  static let Presentation = TargetDependency.presentation(feature: String(describing: Self.self))
//  static let Package = [Data, Domain, Presentation]
//}

extension TargetDependency {
  public struct Project {
    public struct Core {}
    public struct Module {}
    public struct UserInterface {}
  }
}

public extension TargetDependency.Project {
  static let Data = TargetDependency.data(name: "Data")
  static let Domain = TargetDependency.domain(name: "Domain")
  static let Presentation = TargetDependency.presentation(name : "Presentation")
}

public extension TargetDependency.Project.Core {
  static let core = TargetDependency.core(name : "Core")
}

public extension TargetDependency.Project.UserInterface {
  static let DesignSystem = TargetDependency.userInterface(name: "DesignSystem")
}

public extension TargetDependency.Project.Module {
  static let CoreKit = TargetDependency.module(name: "CoreKit")
  static let DevelopTool = TargetDependency.module(name: "DevelopTool")
  static let RxPackage = TargetDependency.module(name: "RxPackage")
  static let ThirdPartyDynamicLibraryPluginManager = TargetDependency.module(name: "ThirdPartyDynamicLibraryPluginManager")
  static let ThirdPartyLibraryManager = TargetDependency.module(name: "ThirdPartyLibraryManager")
  static let UtilityKit = TargetDependency.module(name: "UtilityKit")
  static let RepositoryInjectManager = TargetDependency.module(name: "RepositoryInjectManager")
  static let NetworkAPIKit = TargetDependency.network(name: "NetworkAPIKit")
}
