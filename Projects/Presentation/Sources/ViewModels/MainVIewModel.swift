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
  
  // MARK: - Initialize
  public init() {}
  
  // MARK: - Route
  func backButtonTapped() {
    steps.accept(AppStep.backToLogin)
  }
}
