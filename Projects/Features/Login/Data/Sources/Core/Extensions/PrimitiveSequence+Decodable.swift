//
//  PrimitiveSequence+Model.swift
//  Data
//
//  Created by Mephrine on 2021/09/27.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Moya
import RxSwift

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
  func map<T: Decodable>(to type: T.Type) -> Single<T> {
    flatMap { response -> Single<T> in
      return Single.just(try response.map(to: type))
    }
  }
  func map<T: Decodable>(to type: [T.Type]) -> Single<[T]> {
    flatMap { response -> Single<[T]> in
      return Single.just(try response.map(to: type))
    }
  }
}
