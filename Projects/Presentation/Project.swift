import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Presentation",
                     dependencies: [
                      .Project.Domain,
                      .Project.Module.RxPackage,
                     ])
