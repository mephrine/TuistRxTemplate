import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "ViewModels",
                     dependencies: [
//                      TargetDependency.Project.Data.ViewModels,
                      .Project.Module.ThirdPartyLibraryManager,
                      .Project.Module.RxPackage,
                     ])
