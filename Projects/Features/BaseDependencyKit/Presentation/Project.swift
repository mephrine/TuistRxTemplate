
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .framework(name: "BaseDependencyKitPresentation",
                   dependencies: [
                    .Project.Module.RxPackage,
                    .Project.Module.ThirdPartyLibraryManager,
                    .Project.UserInterface.DesignSystem,
                    .Project.Module.UtilityKit,
                    .Project.Module.GlobalManager,
                    .Project.UserInterface.LocalizableStringManager,
                    .Project.UserInterface.UserInterfaceLibraryManager
                   ])
