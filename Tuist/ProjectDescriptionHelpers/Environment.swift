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
    "ApiURL": "$(API_URL)",
    "SocketURL": "$(SOCKET_URL)"
  ]) { _, last in last }
}
