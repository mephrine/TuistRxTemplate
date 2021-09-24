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
//    public struct Feature {
//      public struct Login {}
//    }
//    public struct Core {}
//    public struct Module {}
//    public struct UserInterface {}
    public struct Core {}
    public struct Data {}
    public struct Domain {}
    public struct Presentation {}
    public struct Module {}
    public struct UserInterface {}
  }
}

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
