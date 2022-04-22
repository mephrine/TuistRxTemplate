import RxSwift
import UIKit
import UtilityKit

open class BaseViewController: UIViewController,
  HasSetupConstraints,
  HasDisposeBag {
  // MARK: - Properties
  public let disposeBag = DisposeBag()

  // MARK: - Inheritance
  open func setupConstraints() {}

  // MARK: - Initialization & Deinitialization

  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required convenience public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    Logger.i(Self.self)
  }

  // MARK: - View Lifecycle

  open override func viewDidLoad() {
    super.viewDidLoad()
    view.setNeedsUpdateConstraints()
  }

  // MARK: - Layout Constraints
  private(set) public var didSetupConstraints: Bool = false

  open override func updateViewConstraints() {
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
