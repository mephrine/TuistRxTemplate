import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .framework(name: "RxPackage",
               packages: [
                .RxFlow,
                .RxSwift,
                .RxSwiftExt,
                .RxReachability
               ],
               dependencies: [
                .SPM.RxFlow,
                .SPM.RxCocoa,
                .SPM.RxRelay,
                .SPM.RxSwift,
                .SPM.RxSwiftExt,
                .SPM.RxReachability
//                .Framework.RxViewController,
               ])
