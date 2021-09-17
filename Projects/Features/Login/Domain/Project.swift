import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "FeatureLoginDomain",
                     dependencies: [
                      .Project.Feature.BaseDependency.Domain,
                     ])
