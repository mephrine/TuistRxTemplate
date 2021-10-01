import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
  .staticFramework(name: "Presentation",
                   dependencies: [
                    .Project.Domain,
                    .Project.Module.ThirdPartyLibraryManager,
                    .Project.Module.RxPackage,
                    .Project.UserInterface.DesignSystem,
                    .Project.Module.UtilityKit
//                    .Project.Network.Service,
//                    .Project.Network.APIKit,
                   ],
                   infoPlist: [
                     "NSAppTransportSecurity": .dictionary([
                      "NSAllowsArbitraryLoads": .boolean(true)
                     ])
                   ],
                   hasDemoApp: true)
