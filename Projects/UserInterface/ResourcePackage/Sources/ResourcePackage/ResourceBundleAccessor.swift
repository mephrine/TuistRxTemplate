//
//  File.swift
//  
//
//  Created by Mephrine on 2021/12/23.
//

import Foundation

extension Bundle {
  public static let assets = Bundle.myModule
}

private class CurrentBundleFinder {}
extension Foundation.Bundle {
    static var myModule: Bundle = {
        /* The name of your package. You may have same PackageName and TargetName*/
        let bundleNameIOS = "ResourcePackage_ResourcePackage"
        let bundleNameMacOs = "ResourcePackage_ResourcePackage"
        
        let candidates = [
            /* Bundle should be present here when the package is linked into an App. */
            Bundle.main.resourceURL,
            /* Bundle should be present here when the package is linked into a framework. */
            Bundle(for: CurrentBundleFinder.self).resourceURL,
            // -> Optional UI Tests
            /* Bundle should be present here when the package is used in UI Tests. */
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent(),
            /* For command-line tools. */
            Bundle.main.bundleURL,
            /* Bundle should be present here when running previews from a different package (this is the path to "…/Debug-iphonesimulator/"). */
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent(),
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent(),
        ]
        
        for candidate in candidates {
            let bundlePathiOS = candidate?.appendingPathComponent(bundleNameIOS + ".bundle")
            let bundlePathMacOS = candidate?.appendingPathComponent(bundleNameMacOs + ".bundle")
            if let bundle = bundlePathiOS.flatMap(Bundle.init(url:)) {
                return bundle
            } else if let bundle = bundlePathMacOS.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle")
    }()
}

public extension R.Color {
}
