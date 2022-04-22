//
//  BaseViewable.swift
//  Presentation
//
//  Created by Mephrine on 2021/12/02.
//  Copyright © 2021 deepfine. All rights reserved.
//
// Refrence: RIBsReactorKit

import UIKit

protocol BaseViewable: UIView, HasSetupConstraints {
  func initialize()
}
