import UIKit
import RxSwift
import ThirdPartyLibraryManager

public class BaseViewController: UIViewController,
  HasSetupConstraints,
  HasDisposeBag {

  // MARK: - Properties
  var disposeBag = DisposeBag()

  // MARK: - Inheritance
  func setupConstraints() {}

  // MARK: - Initialization & Deinitialization
  public init() {
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

  public override func viewDidLoad() {
    super.viewDidLoad()
    view.setNeedsUpdateConstraints()
  }

  // MARK: - Layout Constraints
  private(set) var didSetupConstraints: Bool = false

  public override func updateViewConstraints() {
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
