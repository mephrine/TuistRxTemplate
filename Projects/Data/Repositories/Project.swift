import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "Repositories",
                     dependencies: [
                      .Project.Domain.Repositories,
                      .Project.Domain.Entities,
                      .Project.Data.DataSources,
                      .Project.Data.Models,
                      .Project.Module.RxPackage,
                     ])
