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
//    public struct Presenation {
//      public struct Coordinators {}
//      public struct Views {}
//      public struct ViewModels {}
//    }
    public struct Data {}
    public struct Domain {}
    public struct Presenation {}
    public struct Core {}
    public struct Module {}
    public struct Network {}
    public struct UserInterface {}
  }
}

public extension TargetDependency.Project.Data {
  static let DataSources = TargetDependency.dataSource(name: "DataSources")
  static let Models = TargetDependency.model(name: "Models")
  static let Repositories = TargetDependency.repositoryInData(name: "Repositories")
//  static let Package: [TargetDependency] = [dataSources, models, repositories]
}

public extension TargetDependency.Project.Domain {
  static let Entities = TargetDependency.entity(name: "Entities")
  static let Repositories = TargetDependency.repositoryInDomain(name: "Repositories")
  static let UseCases = TargetDependency.useCase(name: "UseCases")
//  static let Package: [TargetDependency] = [entities, repositories, useCases]
}

public extension TargetDependency.Project.Presenation {
  static let Coordinators = TargetDependency.coordinator(name : "Coordinators")
  static let Views = TargetDependency.view(name : "Views")
  static let ViewModels = TargetDependency.viewModel(name : "ViewModels")
//  static let Package: [TargetDependency] = [coordinators, views, viewModels]
}

//public extension TargetDependency.Project.Data.DataSources {
//  static let dataSources = TargetDependency.dataSource(name: "DataSources")
//}
//
//public extension TargetDependency.Project.Data.Models {
//  static let models = TargetDependency.model(name: "Models")
//}
//
//public extension TargetDependency.Project.Data.Repositories {
//  static let repositories = TargetDependency.repositoryInData(name: "Repositories")
//}

//public extension TargetDependency.Project.Domain.Entities {
//  static let entities = TargetDependency.entity(name: "Entities")
//}
//
//public extension TargetDependency.Project.Domain.Repositories {
//  static let repositories = TargetDependency.repositoryInDomain(name: "Repositories")
//}
//
//public extension TargetDependency.Project.Domain.UseCases {
//  static let useCases = TargetDependency.useCase(name: "UseCases")
//}
//
//public extension TargetDependency.Project.Presenation.Coordinators {
//  static let coordinators = TargetDependency.coordinator(name : "Coordinators")
//}
//
//public extension TargetDependency.Project.Presenation.Views {
//  static let views = TargetDependency.view(name : "Views")
//}
//
//public extension TargetDependency.Project.Presenation.ViewModels {
//  static let viewModels = TargetDependency.viewModel(name : "ViewModels")
//}
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
}

public extension TargetDependency.Project.Network {
  static let APIs   = TargetDependency.network(name: "NetworkAPIs")
  static let APIKit = TargetDependency.network(name: "NetworkAPIKit")
  static let Common = TargetDependency.network(name: "NetworkAPICommon")
}
