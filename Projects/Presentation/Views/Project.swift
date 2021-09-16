import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Views",
                     dependencies: [
                      .Project.Presentation.ViewModels,
                      .Project.UserInterface.DesignSystem,
                      .Project.Module.RxPackage,
                     ])
