import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .framework(name: "ThirdPartyLibraryManager",
               packages: [
                .Moya,
                .Swinject,
                .InjectPropertyWrapper,
                .Logger,
                .Then,
                .Reachability,
                .RxReachability,
               ],
               dependencies: [
//                TargetDependency.Framework.Firebase,
                [.SPM.RxMoya,
                 .SPM.Moya,
                 .SPM.Swinject,
                 .SPM.InjectPropertyWrapper,
                 .SPM.Logger,
                 .SPM.Then,
                 .SPM.Reachability,
                 .SPM.RxReachability],
               ].flatMap { $0 })
