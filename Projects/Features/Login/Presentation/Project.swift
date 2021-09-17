import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "FeatureLoginPresentation",
                     dependencies: [
                      .Project.Feature.BaseDependency.Presentation,
                      .Project.Feature.Login.Domain,
                     ])
