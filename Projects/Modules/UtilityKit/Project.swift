import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "UtilityKit",
                     dependencies: [
                      .Project.Module.RxPackage
                     ])
