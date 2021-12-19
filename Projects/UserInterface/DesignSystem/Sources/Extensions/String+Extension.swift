//
//  String+Extension.swift
//  DesignSystem
//
//  Created by Mephrine on 2021/12/09.
//  Copyright © 2021 benz. All rights reserved.
//

import Foundation

public extension String {
  var localized: String {
    NSLocalizedString(self, tableName: "Localizable", bundle: Bundle.module, value: self, comment: "")
  }
	
	func localized(_ params: Any...) -> String {
		String(format: self, params)
	}
}
