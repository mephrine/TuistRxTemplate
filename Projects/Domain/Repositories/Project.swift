import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Repositories",
                     dependencies: [
                      .Project.Data.Repositories,
                      .Project.Domain.Entities,
                      .Project.Module.RxPackage,
                     ])
