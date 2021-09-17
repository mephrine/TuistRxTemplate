import Foundation
import ProjectDescription

public extension ProjectDescription.Path {
  static func relativeToXCConfig(type: ProjectDeployTarget, name: String) -> Self {
    return .relativeToRoot("XCConfig/\(name)/\(type.rawValue).xcconfig")
  }
  static func relativeToModule(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Modules/\(pathString)")
  }
  static func relativeToFeature(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Features/\(pathString)")
  }
  static func relativeToCore(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Core/\(pathString)")
  }
  static func relativeToPresentation(_ feature: String) -> Self {
    return .relativeToRoot("Projects/Features/\(feature)/Presentation")
  }
  static func relativeToDomain(_ feature: String) -> Self {
    return .relativeToRoot("Projects/Features/\(feature)/Domain")
  }
  static func relativeToData(_ feature: String) -> Self {
    return .relativeToRoot("Projects/Features/\(feature)/Data")
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
  static func feature(name: String) -> Self {
    return .project(target: name, path: .relativeToFeature(name))
  }
  static func data(feature: String) -> Self {
    return .project(target: "Feature\(feature)Data", path: .relativeToData(feature))
  }
  static func domain(feature: String) -> Self {
    return .project(target: "Feature\(feature)Domain", path: .relativeToDomain(feature))
  }
  static func presentation(feature: String) -> Self {
    return .project(target: "Feature\(feature)Presentation", path: .relativeToPresentation(feature))
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
