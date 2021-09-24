import Foundation
import ProjectDescription

// MARK: - Extension
extension TargetDependency {
  public struct SPM {
    public struct DevelopTool {}
    public struct UserInterface {}
  }
}
extension Package {
  public struct DevelopTool {}
  public struct UserInterface {}
}

// MARK: - Network
public extension TargetDependency.SPM {
  static let Kingfisher = TargetDependency.external(name: "Kingfisher")
}

// MARK: - Dependecy Injection
public extension TargetDependency.SPM {
  static let InjectPropertyWrapper = TargetDependency.external(name: "InjectPropertyWrapper")
  static let Swinject = TargetDependency.external(name: "Swinject")
}

// MARK: - Local Storage
public extension TargetDependency.SPM {
  static let Realm = TargetDependency.external(name: "Realm")
  static let RealmSwift = TargetDependency.external(name: "RealmSwift")
}

// MARK: - Layout
public extension TargetDependency.SPM {
  static let FlexLayout = TargetDependency.external(name: "FlexLayout")
  static let PinLayout = TargetDependency.external(name: "PinLayout")
  static let SnapKit = TargetDependency.external(name: "SnapKit")
}

// MARK: - Others
public extension TargetDependency.SPM {
  static let Then = TargetDependency.external(name: "Then")
  static let Logger = TargetDependency.package(product: "Logger")
  static let RxViewController = TargetDependency.package(product: "RxViewController")
  static let Reusable = TargetDependency.external(name: "Reusable")
}

public extension Package {
  static let Logger = Package.local(path: .relativeToLocalModule("Logger"))
  static let RxViewController = Package.local(path: .relativeToLocalModule("RxViewController"))
}

//public extension Package {
//  static let InjectPropertyWrapper = Package.package(url: "https://github.com/egeniq/InjectPropertyWrapper.git", .branch("master"))
//  static let Swinject = Package.package(url: "https://github.com/Swinject/Swinject.git", .branch("master"))
//  static let Kingfisher = Package.package(url: "https://github.com/onevcat/Kingfisher.git", .branch("master"))
//  static let Logger = Package.local(path: .relativeToRoot("Projects/Modules/Local/Logger"))
//}

// MARK: - Develop Tool
public extension TargetDependency.SPM.DevelopTool {
  static let OHHTTPStubs = TargetDependency.external(name: "OHHTTPStubs")
  static let OHHTTPStubsSwift = TargetDependency.external(name: "OHHTTPStubsSwift")
  static let ProxyNetworkStubPackage = TargetDependency.package(product:  "ProxyNetworkStubPackage")
}

public extension Package.DevelopTool {
  static let ProxyNetworkStubPackage = Package.local(path: .relativeToNetwork("ProxyNetworkStubPackage"))
}

// MARK: - User Interface
public extension TargetDependency.SPM.UserInterface {
  static let ResourcePackage = TargetDependency.package(product: "ResourcePackage")
}

public extension Package.UserInterface {
  static let ResourcePackage = Package.local(path: .relativeToUserInterface("ResourcePackage"))
}
