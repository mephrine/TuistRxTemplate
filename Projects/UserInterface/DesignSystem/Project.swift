import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
  .framework(name: "DesignSystem",
             packages: [
              .UserInterface.ResourcePackage,
             ],
             dependencies: [
              .SPM.UserInterface.ResourcePackage,
              .Project.Module.UtilityKit,
              .Project.UserInterface.LocalizableStringManager,
              .Project.UserInterface.UserInterfaceLibraryManager,
             ],
             hasDemoApp: true)
