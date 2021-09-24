import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .framework(name: "RxPresentation",
               packages: [
                .RxViewController
               ],
               dependencies: [
                .Carthage.RxFlow,
                .SPM.RxViewController,
               ])
