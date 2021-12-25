//
//  File.swift
//  
//
//  Created by minsone on 2021/07/09.
//

import UIKit

struct RImage: _ExpressibleByImageLiteral {
    let image: UIImage

    init(imageLiteralResourceName path: String) {
        if let image = UIImage(named: path, in: .assets, compatibleWith: nil) {
            self.image = image
        } else {
            assert(false, "해당 이미지가 없습니다.")
            self.image = UIImage()
        }
    }
}
