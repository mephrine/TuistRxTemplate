import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Repositories",
                     dependencies: [
//                      TargetDependency.Project.Data.Repositories,
                      .Project.Module.CoreKit,
                      .Project.Module.RxPackage,
                     ])
