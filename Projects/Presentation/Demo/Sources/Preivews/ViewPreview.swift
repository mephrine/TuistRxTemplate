//
//  ViewPreview.swift
//  PresentationDemoApp
//
//  Created by Mephrine on 2021/10/09.
//  Copyright © 2021 mephrine. All rights reserved.
//

#if canImport(SwiftUI) && DEBUG
import DesignSystem
import SwiftUI

@available(iOS 13.0, *)
struct ViewPreview: PreviewProvider {
  static var previews: some View {
    UIViewPreview {
      LoginView(frame: CGRect.zero)
    }.previewDevice(PreviewDevice.init(rawValue: "iPhone 12 Pro"))
  }
}
#endif

