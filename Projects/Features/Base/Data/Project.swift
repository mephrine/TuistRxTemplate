
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .staticFramework(name: "BaseData",
                   dependencies: [
                    .Project.Feature.BaseDependencyKit.Data,
                   ])
