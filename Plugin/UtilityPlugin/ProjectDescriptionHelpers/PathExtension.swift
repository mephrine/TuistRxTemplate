import Foundation
import ProjectDescription

public extension ProjectDescription.Path {
  static func relativeToXCConfig(type: ProjectDeployTarget, name: String) -> Self {
    return .relativeToRoot("XCConfig/\(name)/\(type.rawValue).xcconfig")
  }
  static func relativeToModule(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Modules/\(pathString)")
  }
  static func relativeToCore(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Core/\(pathString)")
  }
  static func relativeToPresentation(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Presentation/\(pathString)")
  }
  static func relativeToDomain(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Domain/\(pathString)")
  }
  static func relativeToData(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Data/\(pathString)")
  }
  static func relativeToUserInterface(_ pathString: String) -> Self {
      return .relativeToRoot("Projects/UserInterface/\(pathString)")
  }
  static func relativeToNetwork(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Modules/Network/\(pathString)")
  }
  static func relativeToResource(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Resource/\(pathString)")
  }
  static func relativeToCarthage(_ pathString: String) -> Self {
    return .relativeToRoot("Tuist/Dependencies/Carthage/\(pathString)")
  }
  static var app: Self {
    return .relativeToRoot("Projects/App")
  }
}

// MARK: Extension
extension TargetDependency {
  static func module(name: String) -> Self {
    return .project(target: name, path: .relativeToModule(name))
  }
  static func dataSource(name: String) -> Self {
    return .project(target: name, path: .relativeToData(name))
  }
  static func model(name: String) -> Self {
    return .project(target: name, path: .relativeToData(name))
  }
  static func repositoryInData(name: String) -> Self {
    return .project(target: name, path: .relativeToData(name))
  }
  static func entity(name: String) -> Self {
    return .project(target: name, path: .relativeToDomain(name))
  }
  static func repositoryInDomain(name: String) -> Self {
    return .project(target: name, path: .relativeToDomain(name))
  }
  static func useCase(name: String) -> Self {
    return .project(target: name, path: .relativeToDomain(name))
  }
  static func coordinator(name: String) -> Self {
    return .project(target: name, path: .relativeToPresentation(name))
  }
  static func view(name: String) -> Self {
    return .project(target: name, path: .relativeToPresentation(name))
  }
  static func viewModel(name: String) -> Self {
    return .project(target: name, path: .relativeToPresentation(name))
  }
  static func userInterface(name: String) -> Self {
      return .project(target: name, path: .relativeToUserInterface(name))
  }
  static func network(name: String) -> Self {
    return .project(target: name, path: .relativeToNetwork(name))
  }
  static func core(name: String) -> Self {
    return .project(target: name, path: .relativeToCore(name))
  }
  static func resource(name: String) -> Self {
    return .project(target: name, path: .relativeToResource(name))
  }
}
