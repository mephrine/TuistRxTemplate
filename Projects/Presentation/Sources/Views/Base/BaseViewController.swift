import UIKit
import RxSwift
import ThirdPartyLibraryManager

class BaseViewController:
  UIViewController,
  HasSetupConstraints,
  HasDisposeBag
{

  // MARK: - Properties
  var disposeBag = DisposeBag()

  // MARK: - Inheritance
  func setupConstraints() {}
  
  // MARK: - Initialization & Deinitialization

  init() {
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required convenience init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
//    Logger.info(type(of: self))
  }

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    view.setNeedsUpdateConstraints()
  }

  // MARK: - Layout Constraints
  private(set) var didSetupConstraints: Bool = false

  override func updateViewConstraints() {
    setupConstraintsIfNeeded()
    super.updateViewConstraints()
  }

  // MARK: - Private methods
  private func setupConstraintsIfNeeded() {
    guard !didSetupConstraints else { return }
    setupConstraints()
    didSetupConstraints = true
  }
}

