import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "FeatureBaseDependencyData",
               		 dependencies: [
						.Project.Module.CoreKit,
						.Project.Module.RxPackage,
               		 ])
