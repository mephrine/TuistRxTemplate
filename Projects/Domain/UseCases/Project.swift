import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "UseCases",
                     dependencies: [
                      .Project.Domain.Repositories,
                      .Project.Domain.Entities,
                      .Project.Module.RxPackage,
                     ])
