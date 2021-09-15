import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Entities",
                     dependencies: [
//                      TargetDependency.Project.Domain.Entities,
                      .Project.Module.RxPackage,
                     ])
