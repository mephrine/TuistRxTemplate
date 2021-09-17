import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .staticFramework(name: "RepositoryInjectManager",
                   dependencies: [
                    .Project.Module.CoreKit,
                    .Project.Data,
                    .Project.Domain,
                    .Project.Presentation,
                   ])
