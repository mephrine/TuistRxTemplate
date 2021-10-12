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
    enum Color {
      static let navigationBackground: UIColor = R.Color.Color1
      static let navigationTitle: UIColor = .black
    }
  }
  
  // MARK: - Inject
  @Inject var viewModel: MainViewModel
  
  // MARK: - UI
  private let mainView = MainView(frame: .zero)
  
  //MARK: - Initailzie
  public init(userName loggedInUserName: String) {
    super.init()
    viewModel.initValue(parameter: loggedInUserName)
  }

  // MARK: - View Life Cycle
  public override func loadView() {
    self.view = mainView
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    bindUI()
  }

  override func setupConstraints() {
    
  }
}

extension MainViewController {
  // MARK: - Layout
  private func setupNavigationBar() {
    self.navigationController?.navigationBar.barTintColor = UI.Color.navigationBackground
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UI.Color.navigationTitle]
    self.navigationItem.title = "Main"
  }
  // MARK: - Configuring
  private func bindUI() {
    mainView.logoutButton.rx.throttleTap
      .asDriver()
      .drive { [weak self] _ in
        guard let self = self else { return }
        self.viewModel.logoutButtonTapped()
      }.disposed(by: disposeBag)

    viewModel.userName
      .bind(to: mainView.userNameLabel.rx.text)
      .disposed(by: disposeBag)
  }
}
