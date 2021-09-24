import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .staticFramework(name: "RepositoryInjectManager",
                   dependencies: [
                    .Project.Module.CoreKit,
                    .Project.Module.RxPresentation,
                    .Project.Data,
                    .Project.Domain,
                    .Project.Presentation,
                   ])
