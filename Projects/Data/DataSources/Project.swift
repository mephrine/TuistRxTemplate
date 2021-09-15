import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "DataSources",
                     dependencies: [
                      .Project.Module.CoreKit,
                      .Project.Module.RxPackage,
                     ])
