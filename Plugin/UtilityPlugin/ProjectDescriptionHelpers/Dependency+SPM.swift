import Foundation
import ProjectDescription

// MARK: - Extension
extension TargetDependency {
  public struct SPM {
    public struct DevelopTool {}
    public struct UserInterface {}
  }
}

// MARK: - Network
public extension TargetDependency.SPM {
  static let Kingfisher = TargetDependency.swiftPackageManager(name: "Kingfisher")
  static let Moya = TargetDependency.swiftPackageManager(name: "Moya")
  static let Alamofire = TargetDependency.swiftPackageManager(name: "Alamofire")
  static let Reachability = TargetDependency.swiftPackageManager(name: "Reachability")
}

// MARK: - Rx
public extension TargetDependency.SPM {
  static let RxSwift = TargetDependency.swiftPackageManager(name: "RxSwift")
  static let RxCocoa = TargetDependency.swiftPackageManager(name: "RxCocoa")
  static let RxRelay = TargetDependency.swiftPackageManager(name: "RxRelay")
  static let RxSwiftExt = TargetDependency.swiftPackageManager(name: "RxSwiftExt")
  static let RxFlow = TargetDependency.swiftPackageManager(name: "RxFlow")
  static let RxDataSources = TargetDependency.swiftPackageManager(name: "RxDataSources")
  static let RxReachability = TargetDependency.swiftPackageManager(name: "RxReachability")
  static let RxMoya = TargetDependency.swiftPackageManager(name: "RxMoya")
}

// MARK: - Dependecy Injection
public extension TargetDependency.SPM {
  static let InjectPropertyWrapper = TargetDependency.swiftPackageManager(name: "InjectPropertyWrapper")
  static let Swinject = TargetDependency.swiftPackageManager(name: "Swinject")
}

// MARK: - Local Storage
public extension TargetDependency.SPM {
  static let Realm = TargetDependency.swiftPackageManager(name: "Realm")
  static let RealmSwift = TargetDependency.swiftPackageManager(name: "RealmSwift")
}

// MARK: - Layout
public extension TargetDependency.SPM {
	static let SkeletonView = TargetDependency.swiftPackageManager(name: "SkeletonView")
  static let PinLayout = TargetDependency.swiftPackageManager(name: "PinLayout")
  static let SnapKit = TargetDependency.swiftPackageManager(name: "SnapKit")
}

// MARK: - Others
public extension TargetDependency.SPM {
  static let Then = TargetDependency.swiftPackageManager(name: "Then")
  static let Reusable = TargetDependency.swiftPackageManager(name: "Reusable")
}

// MARK: - Develop Tool
public extension TargetDependency.SPM.DevelopTool {
  static let OHHTTPStubs = TargetDependency.swiftPackageManager(name: "OHHTTPStubs")
  static let OHHTTPStubsSwift = TargetDependency.swiftPackageManager(name: "OHHTTPStubsSwift")
  static let ProxyNetworkStubPackage = TargetDependency.swiftPackageManager(name: "ProxyNetworkStubPackage")
}

// MARK: - User Interface
public extension TargetDependency.SPM.UserInterface {
  static let ResourcePackage =  TargetDependency.swiftPackageManager(name: "ResourcePackage")
}

public extension TargetDependency {
  static func swiftPackageManager(name: String) -> Self {
    TargetDependency.external(name: name)
  }
}
