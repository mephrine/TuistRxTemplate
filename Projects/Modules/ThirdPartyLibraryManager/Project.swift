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
                [.Carthage.RxMoya,
                 .SPM.Swinject,
                 .SPM.InjectPropertyWrapper,
                 .SPM.Logger,
                 .SPM.Then,],
               ].flatMap { $0 })
