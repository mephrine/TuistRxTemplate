import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Coordinators",
                     dependencies: [
                      .Project.Presentation.Views,
                      .Project.Presentation.ViewModels,
                      .Project.Module.RxPackage,
                     ])
