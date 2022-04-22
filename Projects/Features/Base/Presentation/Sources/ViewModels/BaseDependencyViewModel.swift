
import Foundation
import RxCocoa
import RxSwift
import RxFlow
import UtilityKit

// You can conform ViewStateManageableProtocols or ViewTransformableProtocols
// If you conform one, you should nonconform Stepper
public final class BaseDependencyViewModel: Stepper {
  // MARK: - Properties
  public var steps = PublishRelay<Step>()

  // MARK: - Initialize
  public init() {
  }
}

// MARK: - Bind
extension BaseDependencyViewModel {
    
}

// MARK: - UseCase
extension BaseDependencyViewModel {
    
}

// MARK: - Route
extension BaseDependencyViewModel {
    
}
