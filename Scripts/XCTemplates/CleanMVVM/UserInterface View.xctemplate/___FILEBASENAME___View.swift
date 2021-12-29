// ___FILEHEADER___

import ResourcePackage
import SnapKit
import Then
import UIKit

final class ___VARIABLE_productName___View: UIView {
  // MARK: - Constants
  private enum UI {
    /// Base

    enum Color {
      static let background: UIColor = R.Color.<#color#>
    }

    enum Font {
    }
  }
  
  // MARK: - UI properties
  
  
  // MARK: - Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func setupViews() {
    backgroundColor = UI.Color.background
    // TODO: - Setup constraints
  }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct ___VARIABLE_productName___Preview: PreviewProvider {
  static var previews: some View {
    UIViewPreview {
      ___VARIABLE_productName___View(frame: .zero)
    }.previewDevice(PreviewDevice.init(rawValue: "iPhone 12 Pro"))
  }
}
#endif

