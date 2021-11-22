import ProjectDescription

public extension TargetScript {
	static let swiftLint = TargetScript.pre(
		path: ProjectDescription.Path.relativeToRoot("Scripts/SwiftLintRunScript.sh"),
		name: "SwiftLint"
	)
	
	static let googleService = TargetScript.pre(path: "Scripts/matching_google_service_info_plist.sh", name: "Matching GoogleService-Info.plist Script")
}
