import Foundation
import ProjectDescription

// MARK: - Util
public extension ConfigurationName {
    static var dev: ConfigurationName { configuration(ProjectDeployTarget.dev.rawValue) }
    static var test: ConfigurationName { configuration(ProjectDeployTarget.test.rawValue) }
    static var prod: ConfigurationName { configuration(ProjectDeployTarget.prod.rawValue) }
}
