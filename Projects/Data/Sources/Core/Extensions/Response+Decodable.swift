//
//  Response+Decodable.swift
//  Data
//
//  Created by Mephrine on 2021/09/27.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation
import Moya

extension Response {
  func map<T: Decodable>(to type: T.Type) throws -> T {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601withFractionalSeconds
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try map(T.self, using: decoder, failsOnEmptyData: false)
  }

  func map<T: Decodable>(to type: [T.Type]) throws -> [T] {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601withFractionalSeconds
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    return try map([T].self, using: decoder, failsOnEmptyData: false)
  }
}
