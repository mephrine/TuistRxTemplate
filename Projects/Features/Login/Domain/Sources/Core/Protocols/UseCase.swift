//
//  UseCase.swift
//  Domain
//
//  Created by Mephrine on 2021/09/24.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation
import RxSwift

public protocol UseCase {
  associatedtype ReturnType
  associatedtype Params

  func call(params: Params) -> Single<ReturnType>
}
