import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .framework(name: "ThirdPartyLibraryManager",
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
