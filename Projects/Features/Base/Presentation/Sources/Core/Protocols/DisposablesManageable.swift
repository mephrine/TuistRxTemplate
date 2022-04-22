//
//  DisposablesManageable.swift
//  Presentation
//
//  Created by Mephrine on 2021/12/02.
//  Copyright © 2021 deepfine. All rights reserved.
//
// Refrence: RIBsReactorKit

import RxSwift

// MARK: - DisposablesManageable
protocol DisposablesManageable {
  func disposeDisposables()
  func resetDisposables()
}

extension DisposablesManageable where Self: HasCompositeDisposable {
  func disposeDisposables() {
    disposables.dispose()
  }

  func resetDisposables() {
    disposables.dispose()
    disposables = CompositeDisposable()
  }
}
