import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .framework(name: "ThirdPartyLibraryManager",
               packages: [
                .Moya,
                .Swinject,
                .InjectPropertyWrapper
               ],
               dependencies: [
                TargetDependency.Framework.Firebase,
                [.SPM.Moya,
                 .SPM.Swinject,
                 .SPM.InjectPropertyWrapper],
//                [.sdk(name: "libsqlite3.tbd"),
//                 .sdk(name: "StoreKit.framework")],
               ].flatMap { $0 })
