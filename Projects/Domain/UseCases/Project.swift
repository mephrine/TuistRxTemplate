import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "UseCases",
                     dependencies: [
//                      TargetDependency.Project.Domain.UseCases,
                      .Project.Module.ThirdPartyLibraryManager,
                      .Project.Module.RxPackage,
                     ])
