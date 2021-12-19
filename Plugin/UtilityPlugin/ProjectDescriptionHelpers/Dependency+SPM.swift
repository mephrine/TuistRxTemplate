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
  static let Kingfisher = TargetDependency.swiftPackageManager(name: "Kingfisher")
  static let Moya = TargetDependency.package(product: "Moya")
  static let Alamofire = TargetDependency.package(product: "Alamofire")
//  static let Reachability = TargetDependency.package(product: "Reachability")
}

// MARK: - Rx
public extension TargetDependency.SPM {
  static let RxSwift = TargetDependency.package(product: "RxSwift")
  static let RxCocoa = TargetDependency.package(product: "RxCocoa")
  static let RxRelay = TargetDependency.package(product: "RxRelay")
  static let RxSwiftExt = TargetDependency.package(product: "RxSwiftExt")
  static let RxFlow = TargetDependency.package(product: "RxFlow")
  static let RxDataSources = TargetDependency.package(product: "RxDataSources")
  static let RxReachability = TargetDependency.package(product: "RxReachability")
//  static let RxMoya = TargetDependency.package(product: "RxMoya")
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

public extension Package {
  static let InjectPropertyWrapper = Package.package(url: "https://github.com/egeniq/InjectPropertyWrapper.git", .branch("master"))
  static let Swinject = Package.package(url: "https://github.com/Swinject/Swinject.git", .branch("master"))
  static let SnapKit = Package.package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1"))
	static let SkeletonView = Package.package(url: "https://github.com/Juanpe/SkeletonView.git", .upToNextMajor(from: "1.7.0"))
  static let PinLayout = Package.package(url: "https://github.com/layoutBox/PinLayout", .branch("master"))
  static let Kingfisher = Package.package(url: "https://github.com/onevcat/Kingfisher.git", .branch("master"))
  static let Then = Package.package(url: "https://github.com/devxoul/Then", .upToNextMajor(from: "2.7.0"))
  static let Reusable = Package.package(url: "https://github.com/AliSoftware/Reusable.git", .upToNextMajor(from: "4.1.2"))

  static let RxSwift = Package.package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.2.0"))
  static let RxSwiftExt = Package.package(url: "https://github.com/RxSwiftCommunity/RxSwiftExt.git", .branch("main"))
  static let Alamofire = Package.package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.4.0"))
  static let Moya = Package.package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0"))
  static let RxReachability = Package.package(url: "https://github.com/RxSwiftCommunity/RxReachability", .upToNextMajor(from: "1.2.1"))
  static let RxFlow = Package.package(url: "https://github.com/RxSwiftCommunity/RxFlow.git", .upToNextMajor(from: "2.10.0"))
  static let RxDataSources = Package.package(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", .upToNextMajor(from: "5.0.2"))
}

// MARK: - Develop Tool
public extension TargetDependency.SPM.DevelopTool {
  static let OHHTTPStubs = TargetDependency.swiftPackageManager(name: "OHHTTPStubs")
  static let OHHTTPStubsSwift = TargetDependency.swiftPackageManager(name: "OHHTTPStubsSwift")
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

public extension TargetDependency {
  static func swiftPackageManager(name: String) -> Self {
    TargetDependency.package(product: name)
  }
}
