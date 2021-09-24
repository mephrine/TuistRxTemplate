//
//  PrepareAppDelegate.swift
//  App
//
//  Created by Mephrine on 2021/09/17.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation
import AnalyticsKit
import ThirdPartyLibraryManager
import ThirdPartyDynamicLibraryPluginManager
import RepositoryInjectManager

struct PrepareAppDelegateService {
    func load() {
        InjectContainerManager().register()
    }
}
