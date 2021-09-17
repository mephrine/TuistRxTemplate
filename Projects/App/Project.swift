import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin


let appName = "MyApps"
let targetName = "App"
let targetDevName = "Dev\(targetName)"
let targetTestsName = "\(targetDevName)Tests"
let organizationName = "deepfine"
let bundleId = "deepfine.ai.aron"
let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "12.0", devices: .iphone)

let settings: Settings =
  .init(base: ["CODE_SIGN_IDENTITY": "",
               "CODE_SIGNING_REQUIRED": "NO"],
        configurations: [
          .debug(name: .dev,    xcconfig: .relativeToRoot("XCConfig/App/DevApp-DEV.xcconfig")),
          .debug(name: .test,   xcconfig: .relativeToRoot("XCConfig/App/DevApp-TEST.xcconfig")),
          .release(name: .prod, xcconfig: .relativeToRoot("XCConfig/App/DevApp-PROD.xcconfig")),
          .debug(name: .dev,    xcconfig: .relativeToRoot("XCConfig/App/App-DEV.xcconfig")),
          .debug(name: .test,   xcconfig: .relativeToRoot("XCConfig/App/App-TEST.xcconfig")),
          .release(name: .prod, xcconfig: .relativeToRoot("XCConfig/App/App-PROD.xcconfig")),
        ])

let actions: [TargetAction] = [
  .swiftLint,
]

let targets: [Target] = [
  .init(name: targetName,
        platform: .iOS,
        product: .app,
        productName: appName,
        bundleId: bundleId,
        deploymentTarget: deploymentTarget,
        infoPlist: .extendingDefault(with: [
          "UIMainStoryboardFile": "",
          "UILaunchStoryboardName": "LaunchScreen"
        ]),
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        actions: actions,
        dependencies: [
          .Project.Feature.Features,
          .Project.Module.RepositoryInjectManager,
          .Project.Module.ThirdPartyDynamicLibraryPluginManager,
        ].flatMap { $0 }),
  .init(name: "\(targetDevName)",
        platform: .iOS,
        product: .app,
        productName: "\(appName)_dev",
        bundleId: "\(bundleId).dev",
        deploymentTarget: deploymentTarget,
        infoPlist: .extendingDefault(with: [
          "UIMainStoryboardFile": "",
          "UILaunchStoryboardName": "LaunchScreen"
        ]),
        sources: ["Sources/**", "DevSources/**"],
        resources: ["Resources/**"],
        actions: actions,
        dependencies: [
          .Project.Feature.Features,
          .Project.Module.RepositoryInjectManager,
          .Project.Module.DevelopTool,
          .Project.Module.ThirdPartyDynamicLibraryPluginManager,
        ]),
  .init(name: "\(targetTestsName)",
        platform: .iOS,
        product: .unitTests,
        bundleId: "\(bundleId).test",
        deploymentTarget: deploymentTarget,
        infoPlist: .default,
        sources: "Tests/**",
        dependencies: [
          .target(name: "\(targetDevName)"),
          .Carthage.Quick,
          .Carthage.Nimble,
        ]),
]

let schemes: [Scheme] = [
  .init(name: "\(targetDevName)-Develop",
        shared: true,
        buildAction: BuildAction(targets: ["\(targetDevName)"]),
        testAction: TestAction(targets: ["\(targetTestsName)"],
                               configurationName: .dev,
                               coverage: true),
        runAction: RunAction(configurationName: .dev),
        archiveAction: ArchiveAction(configurationName: .dev),
        profileAction: ProfileAction(configurationName: .dev),
        analyzeAction: AnalyzeAction(configurationName: .dev)),
  .init(name: "\(targetName)-PROD",
        shared: true,
        buildAction: BuildAction(targets: ["\(targetName)"]),
        testAction: nil,
        runAction: RunAction(configurationName: .prod),
        archiveAction: ArchiveAction(configurationName: .prod),
        profileAction: ProfileAction(configurationName: .prod),
        analyzeAction: AnalyzeAction(configurationName: .prod)),
]

// MARK: - Project

let project: Project =
  .init(name: targetName,
        organizationName: organizationName,
        settings: settings,
        targets: targets,
        schemes: schemes)
