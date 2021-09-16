import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "DataSources",
                     dependencies: [
                      .Project.Data.Models,
                      .Project.Module.CoreKit,
                     ])
