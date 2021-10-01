//
//  MainViewController.swift
//  Presentation
//
//  Created by Mephrine on 2021/09/27.
//  Copyright © 2021 deepfine. All rights reserved.
//
import RxSwift
import UIKit
import DesignSystem
import InjectPropertyWrapper
import ResourcePackage

final public class MainViewController: BaseViewController, HasViewModel {
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

      static let navigationBackground: UIColor = R.Color.Color1
      static let background: UIColor = primaryTextColor
      static let navigationTitle: UIColor = .black
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

  // MARK: - Inject
  @Inject var viewModel: MainViewModel

  // MARK: - UI
  private let nameTitleLabel = UILabel().then {
    $0.text = "이름"
    $0.font = UI.Font.title
    $0.textColor = UI.Color.title
  }

  private let userNameLabel = UILabel().then {
    $0.font = UI.Font.informationTitle
    $0.textColor = UI.Color.title
  }

  private let logoutButton = UIButton().then {
    $0.setTitle("로그아웃", for: .normal)
    $0.setTitleColor(UI.Color.signupButtonTitle, for: .normal)
    $0.backgroundColor = UI.Color.buttonBackground
    $0.titleLabel?.font = UI.Font.buttonTitle
  }
  
  //MARK: - Initailzie
  public init(userName loggedInUserName: String) {
    super.init()
    viewModel.initValue(parameter: loggedInUserName)
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
    view.addSubview(logoutButton)
  }

  private func layout() {
    nameTitleLabel.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(UI.titleLabelTopMargin)
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

  // MARK: - Configuring
  private func bindUI() {
    logoutButton.rx.throttleTap
      .asDriver()
      .drive { [weak self] _ in
        guard let self = self else { return }
        self.viewModel.logoutButtonTapped()
      }.disposed(by: disposeBag)

    viewModel.userName
      .bind(to: userNameLabel.rx.text)
      .disposed(by: disposeBag)
  }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct MainViewControllerPreview: PreviewProvider {
  static var previews: some View {
    UIViewControllerPreview {
      MainViewController(userName: "abc")
    }
  }
}
#endif
