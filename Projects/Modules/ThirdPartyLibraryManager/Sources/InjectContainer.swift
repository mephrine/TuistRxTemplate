import Foundation
import Swinject
import InjectPropertyWrapper

extension Container: InjectPropertyWrapper.Resolver {}

public struct InjectContainer {
  public static let container: Container = {
    let container = Container()
    InjectSettings.resolver = container
    return container
  }()
}
