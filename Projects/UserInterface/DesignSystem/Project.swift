import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .framework(name: "DesignSystem",
             packages: [
              .UserInterface.ResourcePackage,
              .PinLayout,
              .SnapKit,
              .Kingfisher,
             ],
             dependencies: [
              .Framework.FlexLayout,
              .SPM.UserInterface.ResourcePackage,
              .SPM.PinLayout,
              .SPM.SnapKit,
              .SPM.Kingfisher,
             ],
             hasDemoApp: true)
