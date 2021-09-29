import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .framework(name: "ThirdPartyLibraryManager",
               packages: [
                .Alamofire,
                .Moya,
                .Swinject,
                .InjectPropertyWrapper,
                .Logger,
                .Then,
//                .Reachability,
                .Kingfisher,
                .Reusable
               ],
               dependencies: [
//                TargetDependency.Framework.Firebase,
                [.SPM.Alamofire,
                 .SPM.RxMoya,
                 .SPM.Moya,
                 .SPM.Swinject,
                 .SPM.InjectPropertyWrapper,
                 .SPM.Logger,
                 .SPM.Then,
//                 .SPM.Reachability,
                 .SPM.Kingfisher,
                 .SPM.Reusable],
               ].flatMap { $0 })
