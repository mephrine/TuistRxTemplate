import ProjectDescription
import ProjectDescriptionHelpers

let project = Project
    .framework(name: "CoreKit",
               dependencies: [
                .Project.Network.Service,
                .Project.Module.UtilityKit,
                .Project.Module.RxPackage,
                .Project.Module.ThirdPartyLibraryManager,
                .SPM.Realm,
                .SPM.RealmSwift
               ],
               hasDemoApp: true)
