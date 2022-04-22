import ProjectDescription

let config = Config(
  compatibleXcodeVersions: .upToNextMajor("13.2.1"),
  plugins: [
    .local(path: .relativeToRoot("Plugin/UtilityPlugin"))
  ],
  generationOptions: .options(
    resolveDependenciesWithSystemScm: true,
    disablePackageVersionLocking: false
  )
)
