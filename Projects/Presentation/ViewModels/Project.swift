import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "ViewModels",
                     dependencies: [
                      .Project.Domain.UseCases,
                      .Project.Presentation.Coordinators,
                      .Project.Module.RxPackage,
                     ])
