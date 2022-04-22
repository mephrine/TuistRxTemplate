//
//  UIButton+Rx.swift
//  Presentation
//
//  Created by Mephrine on 2021/09/28.
//  Copyright © 2021 deepfine. All rights reserved.
//

import RxSwift
import UIKit
import RxCocoa

extension Reactive where Base: UIButton {
  public var throttleTap: ControlEvent<Void> {
    ControlEvent(events: tap.throttle(.milliseconds(300), latest: false, scheduler: MainScheduler.instance))
  }
}
