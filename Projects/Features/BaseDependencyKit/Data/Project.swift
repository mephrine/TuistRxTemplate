
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .framework(name: "BaseDependencyKitData",
                   dependencies: [
                    .Project.Module.CoreKit,
                   ])
