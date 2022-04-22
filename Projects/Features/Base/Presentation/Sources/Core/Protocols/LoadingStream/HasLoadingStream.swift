//
//  HasLoadingStream.swift
//  Presentation
//
//  Created by elon on 2021/08/17.
//  Copyright © 2021 benz. All rights reserved.
//
// Reference: RIBsReactorKit

import RxSwift

// MARK: - HasLoadingState
protocol HasLoadingState {
  var isLoading: Bool { get }
}

// MARK: - HasLoadingStream
protocol HasLoadingStream {
  var isLoadingStream: Observable<Bool> { get }
}

//extension HasLoadingStream where Self: PresentableListener, Self.State: HasLoadingState {
//  var isLoadingStream: Observable<Bool> {
//    state.map(\.isLoading)
//  }
//}
//
//extension HasLoadingStream where Self: HasCellViewModel, Self.CellViewModel: HasLoadingState {
//  var isLoadingStream: Observable<Bool> {
//    cellViewModel.map(\.isLoading)
//  }
//}
//
