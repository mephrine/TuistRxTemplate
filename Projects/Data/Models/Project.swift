import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Models",
                     dependencies: [
                      .Project.Domain.Entities,
                     ])
