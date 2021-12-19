//
//  LoginView.swift
//  Presentation
//
//  Created by Mephrine on 2021/10/09.
//  Copyright © 2021 deepfine. All rights reserved.
//

import DesignSystem
import SnapKit
import UIKit

final class LoginView: UIView {
  // MARK: - Constants
  private enum UI {
    static let buttonHeight: CGFloat = 50
    
    /// Base
    static let horizontalMargin: CGFloat = 20
    static let viewVerticalSpacing: CGFloat = 10
    static let sectionVerticalSpacing: CGFloat = 20
    
    /// emailLabel
    static let emailLabelTopMargin: CGFloat = 50
    
    /// loginButton
    static let loginButtonTopMargin: CGFloat = 40
    
    enum Color {
      static let primaryColor: UIColor = .systemBlue
      static let primaryTextColor: UIColor = .white
      
      static let background: UIColor = primaryTextColor
      static let title: UIColor = .darkText
      static let placeholder: UIColor = .lightGray
      static let signupButtonTitle: UIColor = .darkText
      static let buttonBackground: UIColor = primaryColor
      static let buttonTilte: UIColor = primaryTextColor
    }
    
    enum Font {
      static let title = UIFont.boldSystemFont(ofSize: 24)
      static let inputTitle = UIFont.systemFont(ofSize: 15)
      static let buttonTitle = UIFont.boldSystemFont(ofSize: 20)
    }
  }
  
  // MARK: - UI
  private lazy var emailLabel = UILabel().then {
		$0.text = "Email".localized
    $0.font = UI.Font.title
    self.addSubview($0)
  }
  
  lazy var emailTextField = UITextField().then {
    $0.placeholder = "E-Mail"
    $0.font = UI.Font.inputTitle
    $0.borderStyle = .roundedRect
    self.addSubview($0)
  }
  
  private lazy var passwordLabel = UILabel().then {
		$0.text = "Password".localized
    $0.font = UI.Font.title
    self.addSubview($0)
  }
  
  lazy var passwordTextField = UITextField().then {
    $0.placeholder = "Password"
    $0.font = UI.Font.inputTitle
    $0.isSecureTextEntry = true
    $0.borderStyle = .roundedRect
    self.addSubview($0)
  }
  
  lazy var loginButton = UIButton().then {
		$0.setTitle("Login".localized, for: .normal)
    $0.setTitleColor(UI.Color.buttonTilte, for: .normal)
    $0.titleLabel?.font = UI.Font.buttonTitle
    $0.backgroundColor = UI.Color.buttonBackground
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
    
    emailLabel.snp.makeConstraints {
      $0.top.equalTo(self.safeAreaLayoutGuide).offset(UI.emailLabelTopMargin)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    emailTextField.snp.makeConstraints {
      $0.top.equalTo(emailLabel.snp.bottom).offset(UI.viewVerticalSpacing)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    passwordLabel.snp.makeConstraints {
      $0.top.equalTo(emailTextField.snp.bottom).offset(UI.sectionVerticalSpacing)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    passwordTextField.snp.makeConstraints {
      $0.top.equalTo(passwordLabel.snp.bottom).offset(UI.viewVerticalSpacing)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    loginButton.snp.makeConstraints {
      $0.top.equalTo(passwordTextField.snp.bottom).offset(UI.loginButtonTopMargin)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
      $0.height.equalTo(UI.buttonHeight)
    }
  }
}

