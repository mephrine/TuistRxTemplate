import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

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
						 infoPlist: [
							"CFBundleLocalizations": .array(["en", "ko"])
						 ],
						 hasDemoApp: true)
