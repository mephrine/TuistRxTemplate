
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .staticFramework(name: "BaseDomain",
                   dependencies: [
                    .Project.Feature.BaseDependencyKit.Domain,
                   ])
