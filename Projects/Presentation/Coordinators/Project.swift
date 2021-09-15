import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Coordinators",
                     dependencies: [
//                      TargetDependency.Project.Data.Coordinators,
                      .Project.Module.RxPackage,
                     ])
