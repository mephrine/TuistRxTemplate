import ProjectDescription

let dependencies = Dependencies(
  carthage: [
    .github(path: "flipboard/FLEX",
            requirement: .upToNext("4.5.0")),
    .github(path: "Moya/Moya",
            requirement: .upToNext("15.0.0")),
    .github(path: "ReactiveX/RxSwift",
            requirement: .branch("main")),
    .github(path: "RxSwiftCommunity/RxSwiftExt",
            requirement: .branch("main")),
    .github(path: "RxSwiftCommunity/RxFlow",
            requirement: .upToNext("2.12.4")),
    .github(path: "RxSwiftCommunity/RxDataSources",
            requirement: .upToNext("5.0.2")),
    .github(path: "devxoul/RxViewController",
            requirement: .upToNext("2.0.0")),
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
    .package(url: "https://github.com/onevcat/Kingfisher.git", .branch("master")),
    .package(url: "https://github.com/devxoul/Then", .upToNextMajor(from: "2.7.0")),
    .package(url: "https://github.com/AliSoftware/Reusable.git", .upToNextMajor(from: "4.1.2")),
        
    .local(path: .relativeToRoot("Projects/UserInterface/ResourcePackage")),
  ],
  platforms: [.iOS]
)
