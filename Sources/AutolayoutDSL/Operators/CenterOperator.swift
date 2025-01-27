//
//  CenterOperator.swift
//
//  Created by Álvaro Olave Bañeres on 27/6/23.
//

import Foundation
import UIKit

/// Operator that centers a view horizontally in other view
infix operator -|-
public func -|-<A: LayoutProxy>(lhs: A,
                                rhs: UIView) {
    lhs.centerXin(rhs)
}

/// Operator that centers a view horizontally in other view, applying a padding
public func -|-<A: LayoutProxy>(lhs: A,
                                rhs: (UIView, CGFloat)) {
    lhs.centerXin(rhs.0, padding: rhs.1)
}

/// Operator that centers a view vertically in other view
infix operator |-|
public func |-|<A: LayoutProxy>(lhs: A,
                                rhs: UIView) {
    lhs.centerYin(rhs)
}
/// Operator that centers a view vertically in other view, applying a padding
public func |-|<A: LayoutProxy>(lhs: A,
                                rhs: (UIView, CGFloat)) {
    lhs.centerYin(rhs.0, padding: rhs.1)
}
