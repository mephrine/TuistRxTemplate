import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .staticFramework(name: "RepositoryInjectManager",
                   dependencies: [
                    .Project.Module.CoreKit,
                    .Project.Data.DataSources,
                    .Project.Data.Repositories,
                    .Project.Data.Models,
                    .Project.Domain.UseCases,
                    .Project.Domain.Repositories,
                    .Project.Domain.Entities,
                    .Project.Presentation.Coordinators,
                    .Project.Presentation.ViewModels,
                    .Project.Presentation.Views,
                   ])
