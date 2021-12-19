import ProjectDescription
import ProjectDescriptionHelpers

public enum Enviorment {
  public static let appName = "MyApps"
  public static let targetName = "App"
  public static let targetDevName = "Dev\(targetName)"
  public static let targetTestsName = "\(targetDevName)Tests"
  public static let organizationName = "mephrine"
  public static let bundleId = "mephrine.template"
  public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "12.0", devices: .iphone)
  public static let deploymentDemoTarget: DeploymentTarget = .iOS(targetVersion: "13.0", devices: .iphone)
  public static let platform: Platform = .iOS
  public static let baseSetting: SettingsDictionary = [
    "CODE_SIGN_IDENTITY": "",
    "CODE_SIGNING_REQUIRED": "NO"
  ]

  public static let infoPlist: [String: InfoPlist.Value] = [
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen",
    "CFBundleDisplayName": "MyApp",
    "CFBundleShortVersionString": "1.0.0",
    "CFBundleVersion": "1"
]

  public static let appInfoPlist: [String: InfoPlist.Value] = infoPlist.merging([
    "API_URL": "$(API_URL)",
    "SOCKET_URL": "$(SOCKET_URL)",
		"NSAppTransportSecurity": .dictionary([
		 "NSAllowsArbitraryLoads": .boolean(true)
		]),
		"NSCameraUsageDescription": "카메라 사진 업로드 권한 문구 필요",
		"NSPhotoLibraryAddUsageDescription": "앨범 사진 업로드 권한 문구 필요",
		"NSMicrophoneUsageDescription": "카메라 직접 촬영 음성 권한 문구 필요",
		"CFBundleAllowMixedLocalizations": .boolean(true),
  ]) { _, last in last }
}
