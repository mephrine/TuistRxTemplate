//
//  Previews.swift
//  Presentation
//
//  Created by Mephrine on 2021/10/01.
//  Copyright © 2021 deepfine. All rights reserved.
//

#if canImport(SwiftUI) && DEBUG
import DesignSystem
import SwiftUI

@available(iOS 13.0, *)
struct ViewControllerPreview: PreviewProvider {
  static var previews: some View {
    UIViewControllerPreview {
      DemoViewController()
    }
  }
}
#endif

