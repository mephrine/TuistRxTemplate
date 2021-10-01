import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .staticFramework(name: "NetworkService",
                     dependencies: [
                      .Project.Network.APIKit
                     ],
                     infoPlist: [
                       "NSAppTransportSecurity": .dictionary([
                        "NSAllowsArbitraryLoads": .boolean(true)
                       ])
                     ])
