import Foundation
import ProjectDescription

// MARK: Carthage
public extension TargetDependency {
    struct Carthage {}
}

public extension TargetDependency.Carthage {
    static let Nimble             = TargetDependency.carthage(name: "Nimble")
    static let Quick              = TargetDependency.carthage(name: "Quick")
    static let RxBlocking         = TargetDependency.carthage(name: "RxBlocking")
    static let RxTest             = TargetDependency.carthage(name: "RxTest")
    static let RxNimbleRxBlocking = TargetDependency.carthage(name: "RxNimbleRxBlocking")
    static let RxNimbleRxTest     = TargetDependency.carthage(name: "RxNimbleRxTest")
}

public extension TargetDependency {
    static func carthage(name: String) -> Self {
      return .xcFramework(path: .relativeToCarthage("\(name).xcframework"))
    }
}
