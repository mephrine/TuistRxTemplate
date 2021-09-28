//
//  HasResult.swift
//  Data
//
//  Created by Mephrine on 2021/09/24.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation

protocol HasResult {
  associatedtype Result
  
  var resultCode: String { get set }
  var resultMessage: String { get set }
  var result: Result? { get set }
}

//ResultIncludable
public struct ResultDTO<T: Decodable>: HasResult, Decodable {
  var result: T?
  var resultCode: String
  var resultMessage: String
  
  enum CodingKeys: String, CodingKey {
    case result
    case resultCode = "result_code"
    case resultMessage = "result_message"
  }
}

public struct ResultListDTO<T: Decodable>: HasResult, Decodable {
  var result: [T]?
  var resultCode: String
  var resultMessage: String
  
  enum CodingKeys: String, CodingKey {
    case result
    case resultCode = "result_code"
    case resultMessage = "result_message"
  }
}
