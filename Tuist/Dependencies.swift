import ProjectDescription

let dependencies = Dependencies(
  carthage: [
    .github(path: "flipboard/FLEX",
            requirement: .upToNext("4.5.0")),
    .github(path: "ReactiveX/RxSwift",
            requirement: .branch("main")),
    .github(path: "Quick/Quick",
            requirement: .branch("main")),
    .github(path: "Quick/Nimble",
            requirement: .branch("main")),
    .github(path: "RxSwiftCommunity/RxNimble",
            requirement: .branch("master"))
  ],
  swiftPackageManager: [
    .remote(url: "https://github.com/AliSoftware/OHHTTPStubs.git", requirement: .branch("master")),
    .remote(url: "https://github.com/egeniq/InjectPropertyWrapper.git", requirement: .branch("master")),
    .remote(url: "https://github.com/Swinject/Swinject.git", requirement: .branch("master")),
    .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMajor(from: "5.0.1")),
    .remote(url: "https://github.com/Juanpe/SkeletonView.git", requirement: .upToNextMajor(from: "1.7.0")),
    .remote(url: "https://github.com/layoutBox/PinLayout", requirement: .branch("master")),
    .remote(url: "https://github.com/devxoul/Then", requirement: .upToNextMajor(from: "2.7.0")),
    .remote(url: "https://github.com/AliSoftware/Reusable.git", requirement: .upToNextMajor(from: "4.1.2")),
    .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .upToNextMajor(from: "6.2.0")),
    .remote(url: "https://github.com/RxSwiftCommunity/RxSwiftExt.git", requirement: .branch("main")),
    .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMajor(from: "5.4.0")),
    .remote(url: "https://github.com/Moya/Moya.git", requirement: .upToNextMajor(from: "15.0.0")),
    .remote(url: "https://github.com/RxSwiftCommunity/RxReachability", requirement: .upToNextMajor(from: "1.2.1")),
    .remote(url: "https://github.com/RxSwiftCommunity/RxFlow.git", requirement: .upToNextMajor(from: "2.10.0")),
    .remote(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", requirement: .upToNextMajor(from: "5.0.2")),
    .remote(url: "https://github.com/realm/realm-swift.git", requirement: .upToNextMajor(from: "10.21.1")),
    .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .branch("master")),
    .local(path: .relativeToRoot("Projects/UserInterface/ResourcePackage")),
    .local(path: .relativeToRoot("Projects/Network/ProxyNetworkStubPackage"))
  ],
  platforms: [.iOS]
)
