import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Data",
                     dependencies: [
                      .Project.Feature.Base.Data,
                      .Project.Feature.BaseDependencyKit.Data,
                      .Project.Feature.Login.Domain
                     ])
