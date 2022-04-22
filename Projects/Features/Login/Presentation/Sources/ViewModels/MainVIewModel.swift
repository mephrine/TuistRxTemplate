//
//  MainVIewModel.swift
//  Presentation
//
//  Created by Mephrine on 2021/09/27.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxFlow
import UtilityKit

public final class MainViewModel: Stepper {
  // MARK: - Properties
  public var steps = PublishRelay<Step>()
  public let userName = BehaviorSubject<String>(value: "")

  // MARK: - Initialize
  public init() {}
  
  func initValue(parameter: String) {
    userName.onNext(parameter)
  }

  // MARK: - Route
  func logoutButtonTapped() {
    steps.accept(AppStep.backToLogin)
  }
}
