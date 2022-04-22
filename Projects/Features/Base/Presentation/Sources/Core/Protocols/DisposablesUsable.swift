//
//  DisposablesUsable.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

// Reference: RIBsReactorKit

import RxSwift

protocol DisposablesUsable {
  func disposeDisposable()
  func resetDisposables()
}

extension DisposablesUsable where Self: HasCompositeDisposable {
  func disposeDisposable() {
    disposables.dispose()
  }

  func resetDisposables() {
    disposables.dispose()
    disposables = CompositeDisposable()
  }
}
