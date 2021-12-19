import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .framework(name: "ThirdPartyLibraryManager",
               packages: [
                .Moya,
                .Swinject,
                .InjectPropertyWrapper,
                .Then,
                .Kingfisher,
                .Reusable
               ],
               dependencies: [
//                TargetDependency.Framework.Firebase,
                [
                 .SPM.Moya,
                 .SPM.Swinject,
                 .SPM.InjectPropertyWrapper,
                 .SPM.Kingfisher,
                 .SPM.Reusable,
								],
               ].flatMap { $0 })
