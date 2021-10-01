import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .framework(name: "DesignSystem",
             packages: [
              .UserInterface.ResourcePackage,
              .PinLayout,
              .SnapKit
             ],
             dependencies: [
              .Framework.FlexLayout,
              .SPM.UserInterface.ResourcePackage,
              .SPM.PinLayout,
              .SPM.SnapKit
             ],
             hasDemoApp: true)
