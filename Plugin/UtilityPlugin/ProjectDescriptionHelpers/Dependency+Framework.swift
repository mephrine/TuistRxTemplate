import Foundation
import ProjectDescription

// MARK: Framework
public extension TargetDependency {
    struct Framework {}
}

public extension TargetDependency.Framework {
    static let Firebase: [TargetDependency] = [
        .firebase(name: "FirebaseMessaging"),
    ]
}

public extension TargetDependency {
    static func firebase(name: String) -> Self {
        return .framework(path: .relativeToRoot("Vendor/Firebase/\(name).framework"))
    }
}
