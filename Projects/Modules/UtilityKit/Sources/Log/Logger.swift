//
//  Logger.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/12/06.
//  Copyright © 2021 benz. All rights reserved.
//

import Foundation

public enum Logger {
  private enum Level: String {
    case d = "💬 DEBUG"
    case i = "💡 INFO"
    case e = "⚠️ ERROR"
    case f = "🔥 FATAL"
  }

  private static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"
    return formatter
  }()

  private static var currentDateString: String {
    return dateFormatter.string(from: Date())
  }

  private static func log(
    level: Level,
    fileName: String = #file,
    function: String = #function,
    line: Int = #line,
    separator: String = " ",
    _ items: Any...
  ) {
#if DEBUG
    let pretty = "\(currentDateString) \(level.rawValue) \(sourceFileName(filePath: fileName)):#\(line) \(function) ->"
    let output = toOutput(with: items)
    print(pretty, output)
#endif
  }

  public static func d(
    fileName: String = #file,
    function: String = #function,
    line: Int = #line,
    separator: String = " ",
    _ items: Any...
  ) {
    log(level: .d, fileName: fileName, function: function, line: line, separator: separator, items)
  }

  public static func i(
    fileName: String = #file,
    function: String = #function,
    line: Int = #line,
    separator: String = " ",
    _ items: Any...
  ) {
    log(level: .i, fileName: fileName, function: function, line: line, separator: separator, items)
  }

  public static func e(
    fileName: String = #file,
    function: String = #function,
    line: Int = #line,
    separator: String = " ",
    _ items: Any...
  ) {
    log(level: .e, fileName: fileName, function: function, line: line, separator: separator, items)
  }

  public static func f(
    fileName: String = #file,
    function: String = #function,
    line: Int = #line,
    separator: String = " ",
    _ items: Any...
  ) {
    log(level: .f, fileName: fileName, function: function, line: line, separator: separator, items)
  }

  private static func sourceFileName(filePath: String) -> String {
    let components = filePath.components(separatedBy: "/")
    let fileName = components.last ?? ""
    return String(fileName.split(separator: ".").first ?? "")
  }

  private static func toOutput(with items: [Any]) -> Any {
    return items.map { String("\($0)") }.joined(separator: " ")
  }

}
