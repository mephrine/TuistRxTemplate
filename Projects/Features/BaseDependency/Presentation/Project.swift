import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "FeatureBaseDependencyPresentation",
               		 dependencies: [
						.Project.UserInterface.DesignSystem,
						.Project.Module.RxPackage,
               		 ],
					 hasDemoApp: true)
