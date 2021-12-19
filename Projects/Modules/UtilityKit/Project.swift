import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
	.framework(name: "UtilityKit",
						 packages: [
							.Then,
						 ],
						 dependencies: [
							.Project.Module.RxPackage,
							.SPM.Then,
						 ])
