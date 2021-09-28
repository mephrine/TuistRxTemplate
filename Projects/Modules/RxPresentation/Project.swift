import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .framework(name: "RxPresentation",
               packages: [
                .RxFlow
               ],
               dependencies: [
                .SPM.RxFlow,
                .Framework.RxViewController,
               ])
