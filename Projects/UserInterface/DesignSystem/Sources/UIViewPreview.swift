//
//  UIViewPreview.swift
//  DesignSystem
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

// Reference : https://seokba.tistory.com/11

import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
public struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View

    public init(_ builder: @escaping () -> View) {
        view = builder()
    }

    public func makeUIView(context: Context) -> UIView {
        view
    }

    public func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
#endif
