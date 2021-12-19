import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .staticFramework(name: "Presentation",
                   dependencies: [
                    .Project.Domain,
                    .Project.Module.ThirdPartyLibraryManager,
                    .Project.Module.RxPackage,
                    .Project.UserInterface.DesignSystem,
                    .Project.Module.UtilityKit
                   ],
                   hasDemoApp: true)
