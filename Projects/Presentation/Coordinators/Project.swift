import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Coordinators",
                     dependencies: [
                      .Project.Module.RxPackage,
                     ])
