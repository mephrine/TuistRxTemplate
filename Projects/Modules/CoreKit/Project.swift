import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .framework(name: "CoreKit",
               dependencies: [
                .Project.Module.NetworkAPIKit,
                .Project.Module.UtilityKit,
                .Project.Module.RxPackage,
                .Project.Module.ThirdPartyLibraryManager,
               ],
               hasDemoApp: true)
