
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .framework(name: "BaseDependencyKitDomain",
                   dependencies: [
                    .Project.Module.RxPackage,
                    .Project.Module.ThirdPartyLibraryManager,
                   ])
