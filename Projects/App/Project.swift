import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let settings: Settings =
  .init(base: Enviorment.baseSetting,
        configurations:
          [
            .debug(name: .dev, xcconfig: .relativeToRoot("XCConfig/App/DevApp-DEV.xcconfig")),
            .debug(name: .test, xcconfig: .relativeToRoot("XCConfig/App/DevApp-TEST.xcconfig")),
            .release(name: .prod, xcconfig: .relativeToRoot("XCConfig/App/DevApp-PROD.xcconfig")),
            .debug(name: .dev, xcconfig: .relativeToRoot("XCConfig/App/App-DEV.xcconfig")),
            .debug(name: .test, xcconfig: .relativeToRoot("XCConfig/App/App-TEST.xcconfig")),
            .release(name: .prod, xcconfig: .relativeToRoot("XCConfig/App/App-PROD.xcconfig"))
          ])

let actions: [TargetAction] = [
  .swiftLint
]

let targets: [Target] = [
  .init(name: Enviorment.targetName,
        platform: .iOS,
        product: .app,
        productName: Enviorment.appName,
        bundleId: Enviorment.bundleId,
        deploymentTarget: Enviorment.deploymentTarget,
        infoPlist: .extendingDefault(with: Enviorment.appInfoPlist),
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        actions: actions,
        dependencies: [
          .Project.Presentation,
          .Project.Module.InjectManager,
          .Project.Module.RxPackage,
          .Project.Module.ThirdPartyDynamicLibraryPluginManager
        ]),
  .init(name: "\(Enviorment.targetDevName)",
        platform: .iOS,
        product: .app,
        productName: "\(Enviorment.appName)_dev",
        bundleId: "\(Enviorment.bundleId).dev",
        deploymentTarget: Enviorment.deploymentTarget,
        infoPlist: .extendingDefault(with: Enviorment.appInfoPlist),
        sources: ["Sources/**", "DevSources/**"],
        resources: ["Resources/**"],
        actions: actions,
        dependencies: [
          .Project.Presentation,
          .Project.Module.InjectManager,
          .Project.Module.DevelopTool,
          .Project.Module.RxPackage,
          .Project.Module.ThirdPartyDynamicLibraryPluginManager
        ]),
  .init(name: "\(Enviorment.targetTestsName)",
        platform: .iOS,
        product: .unitTests,
        bundleId: "\(Enviorment.bundleId).test",
        deploymentTarget: Enviorment.deploymentTarget,
        infoPlist: .default,
        sources: "Tests/**",
        dependencies: [
          .target(name: "\(Enviorment.targetDevName)"),
          .Carthage.Quick,
          .Carthage.Nimble
        ])
]

let schemes: [Scheme] = [
  .init(name: "\(Enviorment.targetDevName)-Develop",
        shared: true,
        buildAction: BuildAction(targets: ["\(Enviorment.targetDevName)"]),
        testAction: TestAction(targets: ["\(Enviorment.targetTestsName)"],
                               configurationName: .dev,
                               coverage: true),
        runAction: RunAction(configurationName: .dev),
        archiveAction: ArchiveAction(configurationName: .dev),
        profileAction: ProfileAction(configurationName: .dev),
        analyzeAction: AnalyzeAction(configurationName: .dev)),
  .init(name: "\(Enviorment.targetName)-PROD",
        shared: true,
        buildAction: BuildAction(targets: ["\(Enviorment.targetName)"]),
        testAction: nil,
        runAction: RunAction(configurationName: .prod),
        archiveAction: ArchiveAction(configurationName: .prod),
        profileAction: ProfileAction(configurationName: .prod),
        analyzeAction: AnalyzeAction(configurationName: .prod))
]

// MARK: - Project

let project: Project =
  .init(name: Enviorment.targetName,
        organizationName: Enviorment.organizationName,
        settings: settings,
        targets: targets,
        schemes: schemes)
