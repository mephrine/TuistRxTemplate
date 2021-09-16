import ProjectDescription

let dependencies = Dependencies(
  carthage: [
    .github(path: "Moya/Moya",
            requirement: .upToNext("15.0.0")),
    .github(path: "ReactiveX/RxSwift",
            requirement: .branch("main")),
    .github(path: "Quick/Quick",
            requirement: .branch("main")),
    .github(path: "Quick/Nimble",
            requirement: .branch("main")),
    .github(path: "RxSwiftCommunity/RxNimble",
            requirement: .branch("master")),
  ],
  swiftPackageManager: [
    .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
    .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", .branch("master")),
    .package(url: "https://github.com/layoutBox/FlexLayout.git", .branch("master")),
    .package(url: "https://github.com/layoutBox/PinLayout", .branch("master")),
//    .package(url: "https://github.com/Swinject/Swinject.git", .branch("master")),
//    .package(url: "https://github.com/egeniq/InjectPropertyWrapper.git", .branch("master")),
    .package(url: "https://github.com/onevcat/Kingfisher.git", .branch("master")),
        
    .local(path: .relativeToRoot("Projects/UserInterface/ResourcePackage")),
  ],
  platforms: [.iOS]
)
