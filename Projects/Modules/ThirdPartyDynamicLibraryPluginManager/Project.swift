import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "ThirdPartyDynamicLibraryPluginManager",
                     dependencies: [
                        [.Project.Module.ThirdPartyLibraryManager
//                         .Project.Module.RxPackage,
                        ]
                     ].flatMap { $0 })
