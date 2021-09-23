//
//  ViewActionTransformable.swift
//  FeatureBaseDependencyPresentation
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation

public protocol ViewActionTransformable: AnyObject {
  associatedtype Action
  associatedtype State
  
  func transform(action: Action) -> State
}
