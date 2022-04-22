import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .framework(name: "RxPackage",
               dependencies: [
                .SPM.RxFlow,
                .SPM.RxCocoa,
                .SPM.RxRelay,
                .SPM.RxSwift,
                .SPM.RxSwiftExt,
                .SPM.RxReachability,
                .SPM.RxDataSources
//                .Framework.RxViewController,
               ])
