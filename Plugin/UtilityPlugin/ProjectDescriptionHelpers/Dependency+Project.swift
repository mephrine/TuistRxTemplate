import Foundation
import ProjectDescription

// MARK: Extension
extension TargetDependency {
  public struct Project {
//    public struct Data {
//      public struct DataSources {}
//      public struct Models {}
//      public struct Repositories {}
//    }
//    public struct Domain {
//      public struct Entities {}
//      public struct Repositories {}
//      public struct UseCases {}
//    }
//    public struct Presentation {
//      public struct Coordinators {}
//      public struct Views {}
//      public struct ViewModels {}
//    }
    public struct Core {}
    public struct Data {}
    public struct Domain {}
    public struct Presentation {}
    public struct Module {}
    public struct UserInterface {}
  }
}

public extension TargetDependency.Project.Data {
  static let DataSources = TargetDependency.dataSource(name: "DataSources")
  static let Models = TargetDependency.model(name: "Models")
  static let Repositories = TargetDependency.repositoryInData(name: "Repositories")
  static let Package = [DataSources, Models, Repositories]
}

public extension TargetDependency.Project.Domain {
  static let Entities = TargetDependency.entity(name: "Entities")
  static let Repositories = TargetDependency.repositoryInDomain(name: "Repositories")
  static let UseCases = TargetDependency.useCase(name: "UseCases")
  static let Package = [Entities, Repositories, UseCases]
}

public extension TargetDependency.Project.Presentation {
  static let Coordinators = TargetDependency.coordinator(name : "Coordinators")
  static let Views = TargetDependency.view(name : "Views")
  static let ViewModels = TargetDependency.viewModel(name : "ViewModels")
  static let Package = [Coordinators, Views, ViewModels]
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
