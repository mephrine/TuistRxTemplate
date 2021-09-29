//
//  LoginViewControllerPreview.swift
//  Presentation
//
//  Created by Mephrine on 2021/09/28.
//  Copyright © 2021 deepfine. All rights reserved.
//

#if canImport(SwiftUI) && DEBUG
import UIKit
import DesignSystem
import SwiftUI
import Presentation

@available(iOS 13.0, *)
struct LoginViewController_Preview: PreviewProvider {
  static var previews: some View {
    UIViewControllerPreview {
      LoginViewController()
    }
  }
}
#endif

