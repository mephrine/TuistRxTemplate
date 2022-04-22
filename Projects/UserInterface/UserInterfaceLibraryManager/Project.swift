import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
  .framework(name: "UserInterfaceLibraryManager",
             dependencies: [
              .SPM.SnapKit,
              .SPM.SkeletonView,
              .SPM.Kingfisher,
              .SPM.Reusable,
             ])
