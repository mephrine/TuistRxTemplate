import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
  .framework(name: "UserInterfaceLibraryManager",
             packages: [
              .SnapKit,
              .SkeletonView,
              .Kingfisher,
              .Reusable,
             ],
             dependencies: [
              .SPM.SnapKit,
              .SPM.SkeletonView,
              .SPM.Kingfisher,
              .SPM.Reusable,
             ])
