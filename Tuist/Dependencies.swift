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
  ],
  platforms: [.iOS]
)
