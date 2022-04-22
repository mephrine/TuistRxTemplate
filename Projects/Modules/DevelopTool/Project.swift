import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
  .framework(name: "DevelopTool",
             dependencies: [
              .SPM.DevelopTool.OHHTTPStubs,
              .SPM.DevelopTool.OHHTTPStubsSwift,
              .SPM.DevelopTool.ProxyNetworkStubPackage,
              .Carthage.FLEX
             ])
