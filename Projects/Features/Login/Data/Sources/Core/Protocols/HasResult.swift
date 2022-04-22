//
//  HasResult.swift
//  Data
//
//  Created by Mephrine on 2021/09/24.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation

protocol HasResult {
  associatedtype ResultData
  var statusCode: String? { get set }
  var statusMessage: String? { get set }
  var errorCode: String? { get set }
  var errorMessage: String? { get set }
  var resultCnt: Int? { get set }
  var resultYn: String? { get set }
  var resultData: ResultData? { get set }
}

// ResultIncludable
public struct ResultDTO<T: Decodable>: HasResult, Decodable {
  var resultData: T?
  var statusCode: String?
  var statusMessage: String?
  var errorCode: String?
  var errorMessage: String?
  var resultCnt: Int?
  var resultYn: String?
}

public struct ResultListDTO<T: Decodable>: HasResult, Decodable {
  var resultData: [T]?
  var statusCode: String?
  var statusMessage: String?
  var errorCode: String?
  var errorMessage: String?
  var resultCnt: Int?
  var resultYn: String?
}
