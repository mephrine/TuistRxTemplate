//
//  PrePareDevelopToolService.swift
//  App
//
//  Created by Mephrine on 2021/09/17.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation
#if canImport(DevelopTool)
import DevelopTool
#endif
#if canImport(FLEX)
import FLEX
#endif

struct PrepareDevelopToolService {
    func load() {
        #if canImport(DevelopTool)
        HTTPStubs.setup()
        #endif

        #if canImport(FLEX)
        FLEXManager.shared.showExplorer()
        #endif
    }
}
