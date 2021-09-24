//
//  UITableView+Extension.swift
//  UtilityKit
//
//  Created by Mephrine on 2021/09/23.
//  Copyright © 2021 deepfine. All rights reserved.
//

// Reference: RIBsReactorKit

import UIKit

public extension UITableView {
  func register<Cell: UITableViewCell>(_: Cell.Type) where Cell: Reusable {
    register(Cell.self, forCellReuseIdentifier: Cell.identifier)
  }

  func register<View: UITableViewHeaderFooterView>(_: View.Type) where View: Reusable {
    register(View.self, forHeaderFooterViewReuseIdentifier: View.identifier)
  }

  // swiftlint:disable force_cast
  func dequeue<Cell: UITableViewCell>(
    _: Cell.Type,
    indexPath: IndexPath
  ) -> Cell where Cell: Reusable {
    dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as! Cell
  }

  func dequeue<View: UITableViewHeaderFooterView>(_: View.Type) -> View where View: Reusable {
    dequeueReusableHeaderFooterView(withIdentifier: View.identifier) as! View
  }
  // swiftlint:enable force_cast
}

