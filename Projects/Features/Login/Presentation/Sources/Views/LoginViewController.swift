import Foundation
import RxSwift
import UIKit
import DesignSystem
import PinLayout
import FlexLayout

public enum LoginAction {
  
}

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

public struct
