//
//  HasListener.swift
//  GlobalManager
//
//  Created by Mephrine on 2022/02/07.
//  Copyright © 2022 deepfine. All rights reserved.
//

import Foundation

public protocol PresentableListener: AnyObject {}

public protocol HasListener {
	var listener: PresentableListener? { get set }
}
