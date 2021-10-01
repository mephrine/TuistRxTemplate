//
//  TestViewController.swift
//  Presentation
//
//  Created by Mephrine on 2021/10/01.
//  Copyright © 2021 deepfine. All rights reserved.
//

import UIKit
import RxSwift
import Logger
import SnapKit

final public class TestViewController: UIViewController {
  private let disposeBag = DisposeBag()
  
  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    let button = UIButton(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
    button.backgroundColor = UIColor.blue
    
    let button2 = UIButton(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
    button2.backgroundColor = .black
    
  
    self.view.addSubview(button)
    self.view.addSubview(button2)
    
    button2.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
      $0.centerX.equalToSuperview()
    }
  }
}
