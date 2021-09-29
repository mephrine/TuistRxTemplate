//
//  ISO8601DateFormatter+Extensios.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

// Reference: RIBsReactorKit

import Foundation
import Then

public extension Formatter {
  static let iso8601withFractionalSeconds = ISO8601DateFormatter().then {
    $0.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
  }
}

public extension JSONDecoder.DateDecodingStrategy {
  static let iso8601withFractionalSeconds = custom {
    let container = try $0.singleValueContainer()
    let string = try container.decode(String.self)

    guard let date = Formatter.iso8601withFractionalSeconds.date(from: string) else {
      throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
    return date
  }
}

public extension JSONEncoder.DateEncodingStrategy {
  static let iso8601withFractionalSeconds = custom {
    var container = $1.singleValueContainer()
    try container.encode(Formatter.iso8601withFractionalSeconds.string(from: $0))
  }
}
