//
//  AppStep.swift
//  Presentation
//
//  Created by Mephrine on 2021/09/24.
//  Copyright © 2021 deepfine. All rights reserved.
//

import RxFlow

enum AppStep: Step {
  // MARK: - Initialize
  case initApp

  // MARK: - Login
  case goToMain(userName: String)

  // MARK: - Main
  case backToLogin
}
