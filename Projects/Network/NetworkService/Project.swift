import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .staticFramework(name: "NetworkService",
                     dependencies: [
                      .Project.Network.APIKit
                     ],
                     infoPlist: [
                       "ApiUrl": "$(API_URL)",
                       "SocketUrl": "$(SOCKET_URL)"
                     ])
