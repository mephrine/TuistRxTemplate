//
//  Disposable+Rx.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

// Reference: RIBsReactorKit

import RxSwift

extension Disposable {

  /// Adds self to `CompositeDisposable`
  ///
  /// - parameter disposables: `CompositeDisposable` to add self to.
  func disposed(by disposables: CompositeDisposable) {
    _ = disposables.insert(self)
  }
}
