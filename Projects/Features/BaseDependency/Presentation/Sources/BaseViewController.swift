import UIKit

import RxSwift
import ThirdPartyLibraryManager

public class BaseViewController:
  UIViewController,
  HasSetupConstraints,
  HasDisposeBag
{

  // MARK: - Properties

  var disposeBag = DisposeBag()

  private(set) var didSetupConstraints: Bool = false

  // MARK: - Initialization & Deinitialization

  init() {
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required convenience init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    Logger.info(type(of: self))
  }

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    view.setNeedsUpdateConstraints()
  }

  // MARK: - Inheritance

  // MARK: - Layout Constraints

  override func updateViewConstraints() {
    setupConstraintsIfNeeded()
    super.updateViewConstraints()
  }

  // MARK: - Internal methods

  func setupConstraints() {
    // Override here
  }

  // MARK: - Private methods

  private func setupConstraintsIfNeeded() {
    guard !didSetupConstraints else { return }
    setupConstraints()
    didSetupConstraints = true
  }
}

