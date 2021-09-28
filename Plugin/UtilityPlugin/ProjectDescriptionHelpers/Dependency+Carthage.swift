import Foundation
import ProjectDescription

// MARK: Carthage
public extension TargetDependency {
  struct Carthage {}
}

public extension TargetDependency.Carthage {
  static let FLEX = TargetDependency.carthage(name: "FLEX")
//  static let Moya = TargetDependency.carthage(name: "Moya")
//  static let RxMoya = TargetDependency.carthage(name: "RxMoya")
//  static let RxSwift = TargetDependency.carthage(name: "RxSwift")
//  static let RxCocoa = TargetDependency.carthage(name: "RxCocoa")
//  static let RxRelay = TargetDependency.carthage(name: "RxRelay")
//  static let RxSwiftExt = TargetDependency.carthage(name: "RxSwiftExt")
//  static let RxFlow = TargetDependency.carthage(name: "RxFlow")
//  static let RxDataSources = TargetDependency.carthage(name: "RxDataSources")
//  static let Reachability = TargetDependency.carthage(name: "Reachability")
//  static let RxReachability = TargetDependency.carthage(name: "RxReachability")
  static let Nimble = TargetDependency.carthage(name: "Nimble")
  static let Quick = TargetDependency.carthage(name: "Quick")
  static let RxBlocking = TargetDependency.carthage(name: "RxBlocking")
  static let RxTest = TargetDependency.carthage(name: "RxTest")
  static let RxNimbleRxBlocking = TargetDependency.carthage(name: "RxNimbleRxBlocking")
  static let RxNimbleRxTest = TargetDependency.carthage(name: "RxNimbleRxTest")
}

public extension TargetDependency {
  static func carthage(name: String) -> Self {
    return .xcframework(path: .relativeToCarthage("\(name).xcframework"))
//    return .external(name: name)
  }
}
