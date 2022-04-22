import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .staticFramework(name: "Presentation",
                   dependencies: [
                    .Project.Feature.Login.Domain,
                    .Project.Feature.Base.Presentation,
                    .Project.Feature.BaseDependencyKit.Presentation
                   ],
                   hasDemoApp: true)
