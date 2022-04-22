import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Domain",
                     dependencies: [
                      .Project.Feature.Base.Domain,
                      .Project.Feature.BaseDependencyKit.Domain
                     ])
