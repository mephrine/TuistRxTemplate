//
//  ViewModelProtocols.swift.swift
//  Presentation
//
//  Created by Mephrine on 2021/12/20.
//  Copyright © 2021 benz. All rights reserved.
//

import Foundation
import RxFlow

public typealias ViewTransformableProtocols = Stepper & ViewActionTransformable & HasDisposeBag

public typealias ViewStateManageableProtocols = Stepper & ViewStateManageable & HasDisposeBag & ActionBindable
