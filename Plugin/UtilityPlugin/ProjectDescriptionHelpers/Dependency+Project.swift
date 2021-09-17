import Foundation
import ProjectDescription

// MARK: Extension
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
  static let CoreKit                               = TargetDependency.module(name: "CoreKit")
  static let DevelopTool                           = TargetDependency.module(name: "DevelopTool")
  static let RxPackage                             = TargetDependency.module(name: "RxPackage")
  static let ThirdPartyDynamicLibraryPluginManager = TargetDependency.module(name: "ThirdPartyDynamicLibraryPluginManager")
  static let ThirdPartyLibraryManager              = TargetDependency.module(name: "ThirdPartyLibraryManager")
  static let UtilityKit                            = TargetDependency.module(name: "UtilityKit")
  static let RepositoryInjectManager               = TargetDependency.module(name: "RepositoryInjectManager")
  static let NetworkKit                            = TargetDependency.network(name: "NetworkAPIKit")
}
