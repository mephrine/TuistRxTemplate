//
//  MainViewController.swift
//  Presentation
//
//  Created by Mephrine on 2021/09/27.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Foundation
import RxSwift
import UIKit
import DesignSystem
import InjectPropertyWrapper

final public class MainViewController: BaseViewController, HasViewModel {
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
      
      static let navigationBackground: UIColor = primaryColor
      static let background: UIColor = primaryTextColor
      static let navigationTitle: UIColor = primaryTextColor
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
  
  // MARK: - Inject
  @Inject var viewModel: MainViewModel
  
  
  // MARK: - UI
  private let nameTitleLabel = UILabel().then {
    $0.text = "이름"
    $0.font = UI.Font.title
  }
  
  private let userNameLabel = UILabel().then {
    $0.font = UI.Font.title
  }
  
  private let backButton = UIButton().then {
    $0.setTitle("로그아웃", for: .normal)
    $0.setTitleColor(UI.Color.signupButtonTitle, for: .normal)
    $0.titleLabel?.font = UI.Font.buttonTitle
  }
  
  // MARK: - View Life Cycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    setupUI()
    bindUI()
  }
  
  override func setupConstraints() {
    layout()
  }
}


extension MainViewController {
  // MARK: - Layout
  private func setupNavigationBar() {
    self.navigationController?.navigationBar.barTintColor = UI.Color.navigationBackground
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UI.Color.navigationTitle]
    self.navigationItem.title = "Main"
  }
  
  private func setupUI() {
    view.backgroundColor = UI.Color.background
    view.addSubview(nameTitleLabel)
    view.addSubview(userNameLabel)
    view.addSubview(backButton)
  }
  
  private func layout() {
    nameTitleLabel.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(UI.emailLabelTopMargin)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    userNameLabel.snp.makeConstraints {
      $0.top.equalTo(nameTitleLabel.snp.bottom).offset(UI.viewVerticalSpacing)
      $0.leading.equalToSuperview().offset(UI.horizontalMargin)
      $0.trailing.equalToSuperview().offset(-UI.horizontalMargin)
    }
    
    backButton.snp.makeConstraints {
      $0.top.equalTo(userNameLabel.snp.bottom).offset(UI.viewVerticalSpacing)
      $0.centerX.equalToSuperview()
      $0.bottom.lessThanOrEqualToSuperview()
    }
  }
  
  // MARK: - Configuring
  private func bindUI() {
    backButton.rx.tap
      .asDriver()
      .throttle(.milliseconds(300))
      .drive { [weak self] _ in
        guard let self = self else { return }
        self.viewModel.backButtonTapped()
      }.disposed(by: disposeBag)
  }
}

