//
//  PullToRefreshable.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

// Refrecne: RIBsReactorKit

import DesignSystem
import RxRelay
import RxSwift
import UIKit

protocol PullToRefreshable {
  var refreshControl: UIRefreshControl { get }
  var refreshEvent: PublishRelay<Void> { get }
}

extension PullToRefreshable where Self: HasDisposeBag {
  func bindRefreshControlEvent() {
    refreshControl.rx.controlEvent(.valueChanged)
    .asObservable()
    .bind(to: refreshEvent)
    .disposed(by: disposeBag)
  }

  func endRefreshing() {
    refreshControl.endRefreshing()
  }
}

extension PullToRefreshable where Self: HasTableView {
  func setRefreshControl() {
    tableView.refreshControl = refreshControl
  }
}

extension PullToRefreshable where Self: HasCollectionView {
  func setRefreshControl() {
    collectionView.refreshControl = refreshControl
  }
}
