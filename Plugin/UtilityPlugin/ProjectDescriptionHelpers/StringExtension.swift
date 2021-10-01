import Foundation

// MARK: - Util
public extension String {
    static var dev: String { ProjectDeployTarget.dev.rawValue }
    static var test: String { ProjectDeployTarget.test.rawValue }
    static var prod: String { ProjectDeployTarget.prod.rawValue }
}
