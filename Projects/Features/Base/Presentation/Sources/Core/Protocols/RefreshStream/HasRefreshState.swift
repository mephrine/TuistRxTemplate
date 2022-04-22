//
//  HasRefreshState.swift
//  Presentation
//
//  Created by elon on 2021/08/17.
//  Copyright © 2021 benz. All rights reserved.
//
// Reference: RIBsReactorKit

import RxSwift

// MARK: - HasRefreshState

protocol HasRefreshState {
  var isRefresh: Bool { get }
}

// MARK: - HasRefreshStream

protocol HasRefreshStream {
  var isRefreshStream: Observable<Bool> { get }
}

//extension HasRefreshStream where Self: PresentableListener, Self.State: HasRefreshState {
//  var isRefreshStream: Observable<Bool> {
//    state.map(\.isRefresh)
//  }
//}
//
//extension HasRefreshStream where Self: HasViewModel, Self.CellViewModel: HasRefreshState {
//  var isRefreshStream: Observable<Bool> {
//    viewModel.map(\.isRefresh)
//  }
//}
