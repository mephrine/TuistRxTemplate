import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
	.framework(name: "UtilityKit",
						 dependencies: [
							.Project.Module.RxPackage,
							.SPM.Then,
						 ])
