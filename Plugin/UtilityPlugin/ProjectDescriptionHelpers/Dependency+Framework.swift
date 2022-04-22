import Foundation
import ProjectDescription

// MARK: Framework
public extension TargetDependency {
  struct Framework {
    public struct DesignSystem {}
    public struct ThirdPartyLibrary {}
  }
}

public extension TargetDependency.Framework.DesignSystem {
  static let FlexLayout: TargetDependency = .designSystem(name: "FlexLayout")
}

public extension TargetDependency.Framework.ThirdPartyLibrary {
  static let Firebase: [TargetDependency] = [
    .firebase(name: "FirebaseMessaging")
  ]
}

public extension TargetDependency {
  static func firebase(name: String) -> Self {
    .framework(path: .relativeToRoot("Library/Vendor/Firebase/\(name).framework"))
  }

  static func designSystem(name: String) -> Self {
    .xcframework(path: .relativeToRoot("Library/DesignSystem/\(name).xcframework"))
  }
}
