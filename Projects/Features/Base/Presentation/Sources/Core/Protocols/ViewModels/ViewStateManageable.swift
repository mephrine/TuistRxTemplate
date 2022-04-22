//
//  ViewStateManageable.swift
//  Presentation
//
//  Created by Mephrine on 2021/12/20.
//  Copyright © 2021 benz. All rights reserved.
//

import Foundation

public protocol ViewStateManageable: AnyObject {
  associatedtype Action
  associatedtype State
  
  var action: Action { get }
  var state: State { get }
}
