import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .framework(name: "ThirdPartyLibraryManager",
               packages: [
                .Swinject,
                .InjectPropertyWrapper
               ],
               dependencies: [
//                TargetDependency.Framework.Firebase,
                [.Carthage.Moya,
                 .SPM.Swinject,
                 .SPM.InjectPropertyWrapper],
//                [.sdk(name: "libsqlite3.tbd"),
//                 .sdk(name: "StoreKit.framework")],
               ].flatMap { $0 })
