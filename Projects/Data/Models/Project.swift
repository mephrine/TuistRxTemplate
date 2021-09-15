import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Models",
                     dependencies: [
//                      TargetDependency.Project.Data.Models,
                      .Project.Module.RxPackage,
                     ])
