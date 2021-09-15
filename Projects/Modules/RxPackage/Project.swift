import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .framework(name: "RxPackage",
               packages: [
                .RxSwift,
               ],
               dependencies: [
                .SPM.RxCocoa,
                .SPM.RxRelay,
                .SPM.RxSwift,
               ])
