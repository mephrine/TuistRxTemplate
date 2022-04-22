import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(name: "MephrineTemplateApp",
                          projects: [
                            "Projects/App",
                          ],
                          schemes: [
                            .Workspace.makeAppScheme(target: .test),
                            .Workspace.makeModuleScheme(name: "CoreKit", target: .test)
                          ])
