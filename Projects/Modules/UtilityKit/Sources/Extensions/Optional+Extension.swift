//
//  Optional+Extension.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation

public extension Optional {
    func ifNil(then value: Wrapped) -> Wrapped {
        return (self ?? value)
    }
}
