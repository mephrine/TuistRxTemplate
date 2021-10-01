import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .staticFramework(name: "InjectManager",
                   dependencies: [
                    .Project.Module.CoreKit,
                    .Project.Data,
                    .Project.Domain,
                    .Project.Presentation
                   ])
