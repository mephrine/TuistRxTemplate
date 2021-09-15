import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Views",
                     dependencies: [
//                      TargetDependency.Project.Data.Views,
                      .Project.UserInterface.DesignSystem,
                      .Project.Module.RxPackage,
                     ])
