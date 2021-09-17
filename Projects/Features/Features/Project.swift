import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .framework(name: "Features",
               resources: nil,
               dependencies: [
                TargetDependency.Project.Feature.Login.Package,
               ].flatMap { $0 })
