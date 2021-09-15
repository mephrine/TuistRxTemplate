import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .framework(name: "DesignSystem",
               packages: [
                .UserInterface.ResourcePackage,
               ],
               dependencies: [
                .SPM.UserInterface.ResourcePackage,
                .SPM.FlexLayout,
                .SPM.PinLayout,
                .SPM.SnapKit,
               ],
               hasDemoApp: true)
