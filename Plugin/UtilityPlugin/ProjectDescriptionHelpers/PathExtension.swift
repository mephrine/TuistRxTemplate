import Foundation
import ProjectDescription

public extension ProjectDescription.Path {
  static func relativeToXCConfig(type: ProjectDeployTarget, name: String) -> Self {
    return .relativeToRoot("XCConfig/\(name)/\(type.rawValue).xcconfig")
  }
  static func relativeToModule(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Modules/\(pathString)")
  }
  static func relativeToSections(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/\(pathString)")
  }
  static func relativeToFeature(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Features/\(pathString)")
  }
  static func relativeToUserInterface(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/UserInterface/\(pathString)")
  }
  static func relativeToNetwork(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Network/\(pathString)")
  }
  static func relativeToLocalModule(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Modules/Local/\(pathString)")
  }
  static func relativeToResource(_ pathString: String) -> Self {
    return .relativeToRoot("Projects/Resource/\(pathString)")
  }
  static func relativeToCarthage(_ pathString: String) -> Self {
    return .relativeToRoot("Tuist/Dependencies/Carthage/Build/\(pathString)")
  }
  static var app: Self {
    return .relativeToRoot("Projects/App")
  }
  static var features: Self {
    return .relativeToRoot("Projects/Features")
  }
}

// MARK: Extension
extension TargetDependency {
  static func module(name: String) -> Self {
    return .project(target: name, path: .relativeToModule(name))
  }
  static func module(name: String, path: String) -> Self {
    return .project(target: name, path: .relativeToModule(path))
  }
  static func feature(name: String, path: String) -> Self {
    return .project(target: name, path: .relativeToFeature(path))
  }
  static func feature(name: String) -> Self {
    return .project(target: name, path: .relativeToFeature(name))
  }
  static func data(name: String) -> Self {
    return .project(target: "\(name)Data", path: .relativeToFeature("\(name)/Data"))
  }
  static func domain(name: String) -> Self {
    return .project(target: "\(name)Domain", path: .relativeToFeature("\(name)/Domain"))
  }
  static func presentation(name: String) -> Self {
    return .project(target: "\(name)Presentation", path: .relativeToFeature("\(name)/Presentation"))
  }
  static func userInterface(name: String) -> Self {
    return .project(target: name, path: .relativeToUserInterface(name))
  }
  static func network(name: String) -> Self {
    return .project(target: name, path: .relativeToNetwork(name))
  }
  static func resource(name: String) -> Self {
    return .project(target: name, path: .relativeToResource(name))
  }
}
