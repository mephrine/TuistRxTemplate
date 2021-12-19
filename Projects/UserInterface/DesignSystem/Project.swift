import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .framework(name: "DesignSystem",
             packages: [
              .UserInterface.ResourcePackage,
              .PinLayout,
              .SnapKit,
							.SkeletonView,
             ],
						 resources: [
							.glob(pattern: "Resources/Base.lproj/Localizable.strings"),
							.glob(pattern: "Resources/en.lproj/Localizable.strings"),
							.glob(pattern: "Resources/ko.lproj/Localizable.strings"),
						 ],
             dependencies: [
							.SPM.UserInterface.ResourcePackage,
              .Framework.FlexLayout,
							.SPM.SkeletonView,
              .SPM.PinLayout,
              .SPM.SnapKit
             ],
             hasDemoApp: true)
