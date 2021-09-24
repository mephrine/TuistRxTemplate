import ProjectDescription
import UtilityPlugin

public extension Project {
    static func staticLibrary(name: String,
                              platform: Platform = .iOS,
                              packages: [Package] = [],
                              dependencies: [TargetDependency] = [],
                              hasDemoApp: Bool = false) -> Self {
        return project(name: name,
                       packages: packages,
                       product: .staticLibrary,
                       platform: platform,
                       dependencies: dependencies,
                       hasDemoApp: hasDemoApp)
    }
    
    static func staticFramework(name: String,
                                platform: Platform = .iOS,
                                packages: [Package] = [],
                                dependencies: [TargetDependency] = [],
                                hasDemoApp: Bool = false) -> Self {
        return project(name: name,
                       packages: packages,
                       product: .staticFramework,
                       platform: platform,
                       dependencies: dependencies,
                       hasDemoApp: hasDemoApp)
    }
    
    static func framework(name: String,
                          platform: Platform = .iOS,
                          packages: [Package] = [],
                          resources: ProjectDescription.ResourceFileElements? = ["Resources/**"],
                          dependencies: [TargetDependency] = [],
                          hasDemoApp: Bool = false) -> Self {
        return project(name: name,
                       packages: packages,
                       resources:resources,
                       demoResources: hasDemoApp ? ["Demo/Resources/**"] : nil,
                       product: .framework,
                       platform: platform,
                       dependencies: dependencies,
                       hasDemoApp: hasDemoApp)
    }
}

public extension Project {
    static func project(name: String,
                        organizationName: String = "deepfine",
                        bundleId: String = "deepfine.ai.aron",
                        packages: [Package] = [],
                        resources: ProjectDescription.ResourceFileElements? = nil,
                        demoResources: ProjectDescription.ResourceFileElements? = nil,
                        product: Product,
                        platform: Platform = .iOS,
                        deploymentTarget: DeploymentTarget? = .iOS(targetVersion: "12.0", devices: .iphone),
                        dependencies: [TargetDependency] = [],
                        infoPlist: [String: InfoPlist.Value] = [:],
                        hasDemoApp: Bool = false) -> Project {
        
        let settings = Settings(base: ["CODE_SIGN_IDENTITY": "",
                                       "CODE_SIGNING_REQUIRED": "NO"],
                                configurations: [
                                    .debug(name: .dev, xcconfig: .relativeToXCConfig(type: .dev, name: name)),
                                    .debug(name: .test, xcconfig: .relativeToXCConfig(type: .test, name: name)),
                                    .release(name: .prod, xcconfig: .relativeToXCConfig(type: .prod, name: name)),
                                ])
        
        let target1 = Target(name: name,
                             platform: platform,
                             product: product,
                             bundleId: bundleId,
                             deploymentTarget: deploymentTarget,
                             infoPlist: .extendingDefault(with: infoPlist),
                             sources: ["Sources/**"],
                             resources: resources,
                             dependencies: dependencies)
      
        
        let demoAppTarget = Target(name: "\(name)DemoApp",
                                   platform: platform,
                                   product: .app,
                                   bundleId: "\(bundleId)DemoApp",
                                   deploymentTarget: deploymentTarget,
                                   infoPlist: .extendingDefault(with: [
                                     "UIMainStoryboardFile": "",
                                     "UILaunchStoryboardName": "LaunchScreen"
                                   ]),
                                   sources: ["Demo/**"],
                                   resources: demoResources,
                                   dependencies: [
                                    .target(name: "\(name)")
                                   ])
        
        let testTargetDependencies: [TargetDependency] = hasDemoApp
            ? [.target(name: "\(name)DemoApp")]
            : [.target(name: "\(name)")]
        let testTarget = Target(name: "\(name)Tests",
                                platform: platform,
                                product: .unitTests,
                                bundleId: "\(bundleId)Tests",
                                deploymentTarget: deploymentTarget,
                                infoPlist: .default,
                                sources: "Tests/**",
                                dependencies: testTargetDependencies)
        
        
        
        
        let schemes: [Scheme] = hasDemoApp
            ? [.makeScheme(target: .dev, name: name), .makeDemoScheme(target: .dev, name: name)]
            : [.makeScheme(target: .dev, name: name)]

        let targets: [Target] = hasDemoApp
            ? [target1, testTarget, demoAppTarget]
            : [target1, testTarget]
        
        return Project(name: name,
                       organizationName: organizationName,
                       packages: packages,
                       settings: settings,
                       targets: targets,
                       schemes: schemes)
    }
}

extension Scheme {
    static func makeScheme(target: ProjectDeployTarget, name: String) -> Self {
        return Scheme(name: "\(name)",
                      shared: true,
                      buildAction: BuildAction(targets: ["\(name)"]),
                      testAction: TestAction(targets: ["\(name)Tests"],
                                             configurationName: target.rawValue,
                                             coverage: true),
                      runAction: RunAction(configurationName: target.rawValue),
                      archiveAction: ArchiveAction(configurationName: target.rawValue),
                      profileAction: ProfileAction(configurationName: target.rawValue),
                      analyzeAction: AnalyzeAction(configurationName: target.rawValue))
    }

    static func makeDemoScheme(target: ProjectDeployTarget, name: String) -> Self {
        return Scheme(name: "\(name)DemoApp",
                      shared: true,
                      buildAction: BuildAction(targets: ["\(name)DemoApp"]),
                      testAction: TestAction(targets: ["\(name)Tests"],
                                             configurationName: target.rawValue,
                                             coverage: true),
                      runAction: RunAction(configurationName: target.rawValue),
                      archiveAction: ArchiveAction(configurationName: target.rawValue),
                      profileAction: ProfileAction(configurationName: target.rawValue),
                      analyzeAction: AnalyzeAction(configurationName: target.rawValue))
    }
}
