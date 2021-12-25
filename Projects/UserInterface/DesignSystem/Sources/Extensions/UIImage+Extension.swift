//
//  UIImage+Extension.swift
//  Presentation
//
//  Created by Mephrine on 2021/12/02.
//  Copyright © 2021 deepfine. All rights reserved.
//

import Kingfisher
import UIKit

public extension UIImageView {
  func setImage(with url: URL?) {
    kf.setImage(with: url)
  }
  
  func cancelDownloadTask() {
    kf.cancelDownloadTask()
  }
}
