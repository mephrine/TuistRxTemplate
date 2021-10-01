//
//  PullToRefreshable.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

// Refrecne: RIBsReactorKit

import UIKit

import RxCocoa
import RxRelay
import RxSwift

protocol PullToRefreshable {
  var refreshControl: UIRefreshControl { get }
  var refreshEvent: PublishRelay<Void> { get }
}

extension PullToRefreshable where Self: HasDisposeBag & HasTableView {
  func setRefreshControl() {
    tableView.refreshControl = refreshControl
  }

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
