import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
  .framework(name: "LocalizableStringManager",
             resources: [
              .glob(pattern: "Resources/Base.lproj/Localizable.strings"),
              .glob(pattern: "Resources/en.lproj/Localizable.strings"),
              .glob(pattern: "Resources/ko.lproj/Localizable.strings"),
             ],
             infoPlist: [
              "CFBundleLocalizations": .array(["en", "ko"])
             ])
