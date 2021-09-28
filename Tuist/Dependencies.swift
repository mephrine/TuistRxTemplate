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
            requirement: .branch("master")),
    
//    .github(path: "ashleymills/Reachability.swift",
//            requirement: .upToNext("5.1.0")),
//    .github(path: "RxSwiftCommunity/RxReachability",
//            requirement: .upToNext("1.2.1")),
//    .github(path: "Moya/Moya",
//            requirement: .upToNext("15.0.0")),
//    .github(path: "RxSwiftCommunity/RxSwiftExt",
//            requirement: .branch("main")),
    
    
//    .github(path: "RxSwiftCommunity/RxFlow",
//            requirement: .upToNext("2.12.4")),
//    .github(path: "RxSwiftCommunity/RxDataSources",
//            requirement: .upToNext("5.0.2")),
//    .github(path: "devxoul/RxViewController",
//            requirement: .upToNext("2.0.0")),
  ],
  swiftPackageManager: [
//    .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
//    .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", .branch("master")),
//    .package(url: "https://github.com/layoutBox/FlexLayout.git", .upToNextMajor(from: "1.3.18")),
//    .package(url: "https://github.com/layoutBox/PinLayout", .branch("master")),
//    .package(url: "https://github.com/onevcat/Kingfisher.git", .branch("master")),
//    .package(url: "https://github.com/devxoul/Then", .upToNextMajor(from: "2.7.0")),
//    .package(url: "https://github.com/AliSoftware/Reusable.git", .upToNextMajor(from: "4.1.2")),
//    .package(url: "https://github.com/egeniq/InjectPropertyWrapper.git", .branch("master")),
//    .package(url: "https://github.com/Swinject/Swinject.git", .branch("master")),
//
////      .package(url: "https://github.com/Alamofire/Alamofire.git", .branch("master")),
//    .package(url: "https://github.com/ReactiveX/RxSwift.git", .branch("main")),
//    .package(url: "https://github.com/RxSwiftCommunity/RxSwiftExt.git", .branch("main")),
//
//    .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
//    .package(url: "https://github.com/ashleymills/Reachability.swift", .upToNextMajor(from: "5.1.0")),
//    .package(url: "https://github.com/RxSwiftCommunity/RxReachability", .upToNextMajor(from: "1.2.1")),
//    .package(url: "https://github.com/RxSwiftCommunity/RxFlow.git",  .upToNextMajor(from: "2.10.0")),
//    .package(url: "https://github.com/RxSwiftCommunity/RxDataSources.git",  .upToNextMajor(from: "4.0.0")),
  ],
  platforms: [.iOS]
)
