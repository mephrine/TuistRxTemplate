
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .staticFramework(name: "BasePresentation",
                   dependencies: [
                    .Project.Feature.BaseDependencyKit.Presentation,
                   ])
