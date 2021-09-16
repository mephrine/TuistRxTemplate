import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .framework(name: "RxPackage",
               dependencies: [
                .Carthage.RxCocoa,
                .Carthage.RxRelay,
                .Carthage.RxSwift,
               ])
