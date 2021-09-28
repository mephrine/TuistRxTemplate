//
//  LoginFixture.swift
//  Data
//
//  Created by Mephrine on 2021/09/27.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation

enum LoginFixture {
  static let data: Data =
  """
  {
    "result_code" : "200",
    "result_message" : "Success",
    "result" : {
      "name" : "Mephrine"
    }
  }
  """.data(using: .utf8)!
}
