//
//  UseCase.swift
//  Domain
//
//  Created by Mephrine on 2021/09/24.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation
import RxPackage

protocol UseCase {
  associatedtype ReturnType
  associatedtype Params
  
  func execute(params: Params) -> Single<ReturnType>
}
