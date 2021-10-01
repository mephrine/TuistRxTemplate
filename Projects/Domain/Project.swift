import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Domain",
                     dependencies: [
                      .Project.Module.RxPackage
                     ])
