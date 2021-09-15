import ProjectDescription

let dependencies = Dependencies(
  carthage: .init(
    [
      .github(path: "Quick/Quick",
              requirement: .branch("main")),
      .github(path: "Quick/Nimble",
              requirement: .branch("main")),
      .github(path: "RxSwiftCommunity/RxNimble",
              requirement: .branch("master")),
    ]
  ),
  swiftPackageManager: .init(
    [
      .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
      .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
      .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", .branch("master")),
      .package(url: "https://github.com/layoutBox/FlexLayout.git", .branch("master")),
      .package(url: "https://github.com/layoutBox/PinLayout", .branch("master")),
      .package(url: "https://github.com/ReactiveX/RxSwift.git", .exact("6.2.0")),
      .local(path: .relativeToRoot("Projects/UserInterface/ResourcePackage")),
    ]
  ),
  platforms: [.iOS]
)
