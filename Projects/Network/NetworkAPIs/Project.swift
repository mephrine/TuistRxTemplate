import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .staticFramework(name: "NetworkAPIs",
                     dependencies: [
                        .Project.Network.Common,
                     ])
