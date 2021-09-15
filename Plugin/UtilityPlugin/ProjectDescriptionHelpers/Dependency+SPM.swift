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


// MARK: - Swift Package Manager
public extension TargetDependency.SPM {
  static let Moya                  = TargetDependency.package(product: "Moya")
  static let RxCocoa               = TargetDependency.package(product: "RxCocoa")
  static let RxRelay               = TargetDependency.package(product: "RxRelay")
  static let RxSwift               = TargetDependency.package(product: "RxSwift")
  static let InjectPropertyWrapper = TargetDependency.package(product: "InjectPropertyWrapper")
  static let Swinject              = TargetDependency.package(product: "Swinject")
  static let FlexLayout            = TargetDependency.package(product: "FlexLayout")
  static let PinLayout             = TargetDependency.package(product: "PinLayout")
  static let SnapKit               = TargetDependency.package(product: "SnapKit")
}

public extension Package {
  static let InjectPropertyWrapper = Package.package(url: "https://github.com/egeniq/InjectPropertyWrapper.git", .branch("master"))
  static let Swinject              = Package.package(url: "https://github.com/Swinject/Swinject.git", .branch("master"))
}


// MARK: - Swift Package Develop Tool

public extension TargetDependency.SPM.DevelopTool {
  static let OHHTTPStubs             = TargetDependency.package(product: "OHHTTPStubs")
  static let OHHTTPStubsSwift        = TargetDependency.package(product: "OHHTTPStubsSwift")
  static let ProxyNetworkStubPackage = TargetDependency.package(product: "ProxyNetworkStubPackage")
}

public extension Package.DevelopTool {
  static let OHHTTPStubs             = Package.package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", .branch("master"))
  static let ProxyNetworkStubPackage = Package.local(path: .relativeToNetwork("ProxyNetworkStubPackage"))
}


// MARK: - Swift Package User Interface
public extension TargetDependency.SPM.UserInterface {
  static let ResourcePackage = TargetDependency.package(product: "ResourcePackage")
}

public extension Package.UserInterface {
  static let ResourcePackage = Package.local(path: .relativeToPresentation("ResourcePackage"))
}
