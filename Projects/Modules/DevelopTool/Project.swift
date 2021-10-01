import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
  .framework(name: "DevelopTool",
             packages: [
              .DevelopTool.OHHTTPStubs,
              .DevelopTool.ProxyNetworkStubPackage
             ],
             dependencies: [
              .SPM.DevelopTool.OHHTTPStubs,
              .SPM.DevelopTool.OHHTTPStubsSwift,
              .SPM.DevelopTool.ProxyNetworkStubPackage,
              .Carthage.FLEX
             ])
