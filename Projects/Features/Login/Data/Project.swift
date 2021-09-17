import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "FeatureLoginData",
                     dependencies: [
                      .Project.Feature.BaseDependency.Data,
                      .Project.Feature.Login.Domain,
                     ])
