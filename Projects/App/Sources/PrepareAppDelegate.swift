//
//  PrepareAppDelegate.swift
//  App
//
//  Created by Mephrine on 2021/09/17.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation
import InjectManager

struct PrepareAppDelegate {
    func load() {
      InjectService().register()
      InjectDataSource().register()
      InjectRepository().register()
      InjectUseCase().register()
      InjectViewModel().register()
    }
}
