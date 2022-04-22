//
//  UIBarButtonItem+Rx.swift
//  BasePresentation
//
//  Created by Mephrine on 2022/02/16.
//  Copyright © 2022 deepfine. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

extension Reactive where Base: UIBarButtonItem {
	public var throttleTap: ControlEvent<Void> {
		ControlEvent(events: tap.throttle(.milliseconds(300), latest: false, scheduler: MainScheduler.instance))
	}
}
