import Foundation
import ProjectDescription

// MARK: Framework
public extension TargetDependency {
  struct Framework {}
}

public extension TargetDependency.Framework {
  static let Firebase: [TargetDependency] = [
    .firebase(name: "FirebaseMessaging")
  ]

//  static let RxViewController: TargetDependency =
//    .rx(name: "RxViewController")

  static let FlexLayout: TargetDependency =
    .designSystem(name: "FlexLayout")
}

public extension TargetDependency {
  static func firebase(name: String) -> Self {
    .framework(path: .relativeToRoot("Vendor/Firebase/\(name).framework"))
  }

  static func designSystem(name: String) -> Self {
    .xcframework(path: .relativeToRoot("Vendor/DesignSystem/\(name).xcframework"))
  }

//  static func rx(name: String) -> Self {
//    .xcframework(path: .relativeToRoot("Vendor/Rx/\(name).xcframework"))
//  }
}
