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
  associatedtype StatusType
  var statusCode: StatusType? { get set }
  var statusMessage: String? { get set }
  var errorCode: StatusType? { get set }
  var errorMessage: String? { get set }
  var resultCnt: Int? { get set }
  var resultYn: String? { get set }
  var resultData: ResultData? { get set }
}

// ResultIncludable
public struct ResultDTO<T: Decodable>: HasResult, Decodable {
  public var resultData: T?
  public var statusCode: String?
  public var statusMessage: String?
  public var errorCode: String?
  public var errorMessage: String?
  public var resultCnt: Int?
  public var resultYn: String?
}

public struct ResultListDTO<T: Decodable>: HasResult, Decodable {
  public var resultData: [T]?
  public var statusCode: String?
  public var statusMessage: String?
  public var errorCode: String?
  public var errorMessage: String?
  public var resultCnt: Int?
  public var resultYn: String?
}

public struct ResultListSocketDTO<T: Decodable>: HasResult, Decodable {
  public var resultData: [T]?
  public var statusCode: Int?
  public var statusMessage: String?
  public var errorCode: Int?
  public var errorMessage: String?
  public var resultCnt: Int?
  public var resultYn: String?
}
