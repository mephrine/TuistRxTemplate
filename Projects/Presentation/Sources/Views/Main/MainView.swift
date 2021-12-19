//
//  MainView.swift
//  Presentation
//
//  Created by Mephrine on 2021/10/09.
//  Copyright © 2021 deepfine. All rights reserved.
//

import DesignSystem
import ResourcePackage
import SnapKit
import UIKit

final class MainView: UIView {
  // MARK: - Constants
  private enum UI {
    static let buttonHeight: CGFloat = 50

    /// Base
    static let horizontalMargin: CGFloat = 20
    static let viewVerticalSpacing: CGFloat = 10
    static let sectionVerticalSpacing: CGFloat = 20

    /// titleLabel
    static let titleLabelTopMargin: CGFloat = 20

    /// logoutButton
    static let logoutButtonTopMargin: CGFloat = 40

    enum Color {
      static let primaryColor: UIColor = .systemBlue
      static let primaryTextColor: UIColor = .white

      static let background: UIColor = primaryTextColor
      static let title: UIColor = .darkText
      static let placeholder: UIColor = .lightGray
      static let signupButtonTitle: UIColor = .white
      static let buttonBackground: UIColor = primaryColor
      static let buttonTilte: UIColor = primaryTextColor
    }

    enum Font {
      static let title = UIFont.boldSystemFont(ofSize: 24)
      static let informationTitle = UIFont.systemFont(ofSize: 20)
      static let buttonTitle = UIFont.boldSystemFont(ofSize: 20)
    }
  }
  
  // MARK: - UI
  private lazy var nameTitleLabel = UILabel().then {
		$0.text = "Name".localized
    $0.font = UI.Font.title
    $0.textColor = UI.Color.title
    self.addSubview($0)
  }

  lazy var userNameLabel = UILabel().then {
    $0.font = UI.Font.informationTitle
    $0.textColor = UI.Color.title
    self.addSubview($0)
  }

  lazy var logoutButton = UIButton().then {
    $0.setTitle("Logout".localized, for: .normal)
    $0.setTitleColor(UI.Color.signupButtonTitle, for: .normal)
    $0.backgroundColor = UI.Color.buttonBackground
    $0.titleLabel?.font = UI.Font.buttonTitle
    self.addSubview($0)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews() {
    backgroundColor = UI.Color.background
    
    nameTitleLabel.snp.makeConstraints {
      $0.top.equalTo(self.safeAreaLayoutGuide).offset(UI.titleLabelTopMargin)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }

    userNameLabel.snp.makeConstraints {
      $0.top.equalTo(nameTitleLabel.snp.bottom).offset(UI.viewVerticalSpacing)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }

    logoutButton.snp.makeConstraints {
      $0.top.equalTo(userNameLabel.snp.bottom).offset(UI.logoutButtonTopMargin)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
      $0.bottom.lessThanOrEqualToSuperview()
      $0.height.equalTo(UI.buttonHeight)
    }
  }
}
