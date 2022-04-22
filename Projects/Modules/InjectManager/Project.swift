import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .staticFramework(name: "InjectManager",
                   dependencies: [
                    TargetDependency.Project.Feature.Features,
                    [
                      .Project.Module.CoreKit,
                      .Project.Module.ThirdPartyLibraryManager
                    ]
                   ].flatMap { $0 })
