import ProjectDescription

public extension TargetAction {
    static let swiftLint = TargetAction.pre(
        path: .relativeToRoot("Scripts/SwiftLintRunScript.sh"),
        name: "SwiftLint"
    )

  static let googleService = TargetAction.pre(path: "Scripts/matching_google_service_info_plist.sh", name: "Matching GoogleService-Info.plist Script")
}
