import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .framework(name: "GlobalManager",
             dependencies: [
              .Project.Module.RxPackage
             ])
