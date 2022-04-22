//
//  LoginViewController.swift
//  PresentationDemoApp
//
//  Created by Mephrine on 2021/09/30.
//  Copyright © 2021 deepfine. All rights reserved.
//

import UIKit
import RxSwift
import Logger
import SnapKit

class DemoViewController: UIViewController {
  private let disposeBag = DisposeBag()
  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    let button = UIButton(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
    button.backgroundColor = UIColor.blue
    
    let button2 = UIButton(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
    button2.backgroundColor = .green
    
  
    self.view.addSubview(button)
    self.view.addSubview(button2)
    
    button2.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
      $0.centerX.equalToSuperview()
    }
  }
}

#if canImport(SwiftUI) && DEBUG
import DesignSystem
import SwiftUI
import Presentation

@available(iOS 13.0, *)
struct DemoViewControllerPreview: PreviewProvider {
  static var previews: some View {
    UIViewControllerPreview {
      DemoViewController()
    }
  }
}
#endif
