// ___FILEHEADER___

import DesignSystem
import InjectPropertyWrapper
import UIKit

final class ___VARIABLE_productName___ViewController: BaseViewController, HasViewModel {
  // MARK: - Constants
  private enum UI {
    enum Color {
      static let navigationBackground: UIColor = .systemBlue
      static let navigationTitle: UIColor = .black
    }
  }
  
  // MARK: - Injection
  @Inject var viewModel: ___VARIABLE_productName___ViewModel
  
  // MARK: - UI
  private let <#view#> = ___VARIABLE_productName___View(frame: .zero)
  
  // MARK: - View Life Cycle
  public override func loadView() {
    self.view = <#view#>
  }
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    bindUI()
  }
  
  override func setupConstraints() {
  }
}

extension ___VARIABLE_productName___ViewController {
  // MARK: - Layout
  private func setupNavigationBar() {
    self.navigationController?.navigationBar.barTintColor = UI.Color.navigationBackground
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UI.Color.navigationTitle]
  }
  // MARK: - Configuring
  private func bindUI() {
    
  }
}


// MARK: - Event
extension ___VARIABLE_productName___ViewController {
  
}
