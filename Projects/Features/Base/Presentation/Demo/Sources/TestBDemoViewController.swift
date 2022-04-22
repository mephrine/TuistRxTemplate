import UIKit

class DemoViewController: UIViewController {
  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

#if canImport(SwiftUI) && DEBUG
import DesignSystem
import SwiftUI

@available(iOS 13.0, *)
struct DemoViewControllerPreview: PreviewProvider {
  static var previews: some View {
    UIViewControllerPreview {
      DemoViewController()
    }
  }
}
#endif
