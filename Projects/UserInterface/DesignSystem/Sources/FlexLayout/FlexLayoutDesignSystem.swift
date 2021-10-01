//
//  FlexLayoutDesignSystem.swift
//  DesignSystem
//
//  Created by minsone on 2021/08/22.
//  Copyright © 2021 minsone. All rights reserved.
//

import UIKit
import FlexLayout

extension UIView {
  public struct FlexLayoutDesignSystem {}
}

public extension UIView.FlexLayoutDesignSystem {
  static var line: UIView {
    let view = UIView()
    view.flex.addItem()
      .height(1)
      .backgroundColor(.systemGray)
    return view
  }
  
  static func bothSideLabel(title: String, info: String) -> BothSideLabelView {
    return BothSideLabelView(title: title, info: info)
  }
}

public class BothSideLabelView {
  private let leftLabel = UILabel()
  private let rightLabel = UILabel()
  
  public var container = UIView()
  
  init(title: String, info: String) {
    leftLabel.text = title
    rightLabel.text = info
    rightLabel.textAlignment = .right
    rightLabel.textColor = .black
    
    container.flex.direction(.row).alignContent(.spaceBetween)
    container.flex.addItem(leftLabel)
    container.flex.addItem(rightLabel).grow(1)
    container.backgroundColor = .blue
  }
  
  public func update(info: String) {
    rightLabel.text = info
  }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct BothSideLabelViewPreview: PreviewProvider {
  static var previews: some View {
    UIViewPreview {
      BothSideLabelView(title: "title", info: "abc")
        .container
    }
  }
}
#endif
