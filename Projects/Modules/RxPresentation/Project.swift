import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .framework(name: "RxPresentation",
               dependencies: [
                .Carthage.RxFlow,
                .Carthage.RxViewController,
               ])
