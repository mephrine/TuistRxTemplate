//
//  PrepareAppDelegate.swift
//  App
//
//  Created by Mephrine on 2021/09/17.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation
import ThirdPartyLibraryManager
import ThirdPartyDynamicLibraryPluginManager
import InjectManager

struct PrepareAppDelegateService {
    func load() {
        InjectContainerManager().register()
    }
}
