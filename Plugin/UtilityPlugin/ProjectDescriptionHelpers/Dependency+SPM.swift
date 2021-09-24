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
  static let Kingfisher = TargetDependency.package(product: "Kingfisher")
}

// MARK: - Dependecy Injection
public extension TargetDependency.SPM {
  static let InjectPropertyWrapper = TargetDependency.package(product: "InjectPropertyWrapper")
  static let Swinject = TargetDependency.package(product: "Swinject")
}

// MARK: - Local Storage
public extension TargetDependency.SPM {
  static let Realm = TargetDependency.package(product: "Realm")
  static let RealmSwift = TargetDependency.package(product: "RealmSwift")
}

// MARK: - Layout
public extension TargetDependency.SPM {
  static let FlexLayout = TargetDependency.package(product: "FlexLayout")
  static let PinLayout = TargetDependency.package(product: "PinLayout")
  static let SnapKit = TargetDependency.package(product: "SnapKit")
}

// MARK: - Others
public extension TargetDependency.SPM {
  static let Then = TargetDependency.package(product: "Then")
  static let Logger = TargetDependency.package(product: "Logger")
  static let Reusable = TargetDependency.package(product: "Reusable")
}


public extension Package {
  static let InjectPropertyWrapper = Package.package(url: "https://github.com/egeniq/InjectPropertyWrapper.git", .branch("master"))
  static let Swinject = Package.package(url: "https://github.com/Swinject/Swinject.git", .branch("master"))
  static let Kingfisher = Package.package(url: "https://github.com/onevcat/Kingfisher.git", .branch("master"))
  static let Logger = Package.local(path: .relativeToRoot("Projects/Modules/Local/Logger"))
}


// MARK: - Develop Tool
public extension TargetDependency.SPM.DevelopTool {
  static let OHHTTPStubs = TargetDependency.package(product: "OHHTTPStubs")
  static let OHHTTPStubsSwift = TargetDependency.package(product: "OHHTTPStubsSwift")
  static let ProxyNetworkStubPackage = TargetDependency.package(product: "ProxyNetworkStubPackage")
}

public extension Package.DevelopTool {
  static let OHHTTPStubs = Package.package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", .branch("master"))
  static let ProxyNetworkStubPackage = Package.local(path: .relativeToNetwork("ProxyNetworkStubPackage"))
}

// MARK: - User Interface
public extension TargetDependency.SPM.UserInterface {
  static let ResourcePackage = TargetDependency.package(product: "ResourcePackage")
}

public extension Package.UserInterface {
  static let ResourcePackage = Package.local(path: .relativeToUserInterface("ResourcePackage"))
}
