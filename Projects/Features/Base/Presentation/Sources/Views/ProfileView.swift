//
//  ProfileView.swift
//  BasePresentation
//
//  Created by 이정현 on 2022/01/18.
//  Copyright © 2022 deepfine. All rights reserved.
//

import Foundation
import Kingfisher
import ResourcePackage
import SnapKit
import Then
import UIKit
import UtilityKit

public final class ProfileView: UIView {
  private let name: String
  private let profileUrl: String?
  private let size: CGFloat
  private let userProfileActivation: UserProfileActivation
  
  // MARK: - Constants
  private enum UI {
    
    
    enum Color {
      static let nameColor: UIColor = .white
      static let textPlaceHolderBg = R.Color.Blue_0070EE
    }
    
    enum Font {
      static let nameFont = UIFont.boldSystemFont(ofSize: 15)
    }
  }
  
  // MARK: - UI
  private lazy var profileImageView = UIImageView().then {
    $0.backgroundColor = .lightGray
    $0.contentMode = .scaleAspectFill
    $0.layer.cornerRadius = size / 2
    $0.layer.masksToBounds = true
    addSubview($0)
  }
  
  private lazy var textPlaceHolder = UILabel().then {
    $0.backgroundColor = UI.Color.textPlaceHolderBg
    $0.font = UI.Font.nameFont
    $0.textColor = UI.Color.nameColor
    $0.layer.cornerRadius = size / 2
    $0.layer.masksToBounds = true
    $0.textAlignment = .center
    addSubview($0)
  }
  
  // MARK: - Initialize
  public init(name: String, profileUrl: String?, size: CGFloat) {
    self.name = name
    self.profileUrl = profileUrl
    self.size = size
    if profileUrl == nil {
      userProfileActivation = .disabled
    } else {
      userProfileActivation = .enabled
    }
    
    super.init(frame: .zero)
    layout()
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Layout
extension ProfileView {
  private func layout() {
    profileImageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
      $0.width.height.equalTo(size)
    }
    
    textPlaceHolder.snp.makeConstraints {
      $0.edges.equalToSuperview()
      $0.width.height.equalTo(size)
    }
  }
  
  private func setupViews() {
    switch userProfileActivation {
    case .enabled:
      textPlaceHolder.isHidden = true
      
      guard let path = profileUrl else { return }
      profileImageView.kf.setImage(
        with: Environment.socketURL.appendingPathComponent(path),
        placeholder: R.Image.UserPlaceholder
      )
      
    case .disabled:
      profileImageView.isHidden = true
      textPlaceHolder.text = calculateUserName()
    
    }
  }
}

// MARK: - Features
extension ProfileView {
  private func calculateUserName() -> String {
    if self.name.count <= 2 {
      return self.name
    } else {
      let indexStartOfName = self.name.index(self.name.startIndex, offsetBy: 1)
      let indexEndOfName = self.name.index(indexStartOfName, offsetBy: 2)
      
      return String(self.name[indexStartOfName..<indexEndOfName])
    }
  }
}

public enum UserProfileActivation {
  case enabled
  case disabled
}


