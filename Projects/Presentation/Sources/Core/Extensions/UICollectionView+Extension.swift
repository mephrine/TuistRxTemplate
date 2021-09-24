//
//  UICollectionView+Extension.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

// Reference: RIBsReactorKit

import UIKit

public extension UICollectionView {
  func register<Cell: UICollectionViewCell>(_: Cell.Type) where Cell: Reusable {
    register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
  }

  func register<View: UICollectionReusableView>(
    _: View.Type
  ) where View: Reusable & HasElementKind {
    register(
      View.self,
      forSupplementaryViewOfKind: View.elementKind,
      withReuseIdentifier: View.identifier
    )
  }

  // swiftlint:disable force_cast
  func dequeue<Cell: UICollectionViewCell>(
    _: Cell.Type,
    indexPath: IndexPath
  ) -> Cell where Cell: Reusable {
    dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
  }

  func dequeue<View: UICollectionReusableView>(
    _: View.Type,
    indexPath: IndexPath
  ) -> View where View: Reusable & HasElementKind {
    dequeueReusableSupplementaryView(
      ofKind: View.elementKind,
      withReuseIdentifier: View.identifier,
      for: indexPath
    ) as! View
  }
  // swiftlint:enable force_cast
}

