//
//  BaseCollectionReusableView.swift
//  Presentation
//
//  Created by Mephrine on 2021/12/02.
//  Copyright © 2021 deepfine. All rights reserved.
//
// Refrence: RIBsReactorKit

import Reusable
import RxSwift
import UIKit

open class BaseCollectionReusableView:
  UICollectionReusableView,
  BaseViewable,
  Reusable,
  HasDisposeBag,
  HasCompositeDisposable,
  DisposablesManageable
{

  // MARK: - Properties
  public private(set) var disposeBag = DisposeBag()
  public internal(set) var disposables = CompositeDisposable()
  public private(set) var didSetupConstraints: Bool = false

  // MARK: - Initialization & Deinitialization
  override init(frame: CGRect) {
    super.init(frame: frame)
    initialize()
  }

  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    disposeDisposables()
  }

  // MARK: - Inheritance
  open override func prepareForReuse() {
    super.prepareForReuse()
    resetDisposables()
  }

  // MARK: - Layout Constraints
  open override func updateConstraints() {
    setupConstraintsIfNeeded()
    super.updateConstraints()
  }

  // MARK: - Internal methods
  open func initialize() {
    // Override point
    setNeedsUpdateConstraints()
  }

  open func setupConstraints() {
    // Override here
  }

  // MARK: - Private methods
  private func setupConstraintsIfNeeded() {
    guard !didSetupConstraints else { return }
    setupConstraints()
    didSetupConstraints = true
  }
}
