import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Repositories",
                     dependencies: [
//                      TargetDependency.Project.Domain.Repositories,
                      .Project.Module.ThirdPartyLibraryManager,
                      .Project.Module.RxPackage,
                     ])
