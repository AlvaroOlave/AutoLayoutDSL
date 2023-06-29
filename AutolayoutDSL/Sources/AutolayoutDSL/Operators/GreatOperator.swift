//
//  GreatOperator.swift
//
//  Created by Álvaro Olave Bañeres on 27/6/23.
//

import Foundation
import UIKit

public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}

public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: (A, UILayoutPriority)) {
    lhs.greaterThanOrEqual(to: rhs.0, priority: rhs.1)
}

public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: ((A, CGFloat), UILayoutPriority)) {
    lhs.greaterThanOrEqual(to: rhs.0.0, offsetBy: rhs.0.1, priority: rhs.1)
}

public func >=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: (A, UILayoutPriority)) {
    lhs.greaterThanOrEqual(to: rhs.0, priority: rhs.1)
}

public func >=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: ((A, DimensionOperation), UILayoutPriority)) {
    switch rhs.0.1 {
    case let .multiplier(value):
        lhs.greaterThanOrEqual(to: rhs.0.0, multiplier: value, priority: rhs.1)
    case let .constant(value):
        lhs.greaterThanOrEqual(to: rhs.0.0, constant: value, priority: rhs.1)
    }
}

public func >=<A: LayoutAnchor>(lhs: LayoutDimensionProperty<A>,
                                rhs: CGFloat) {
    lhs.greaterThanOrEqual(to: rhs)
}

public func >=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}

public func >=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: (A, DimensionOperation)) {
    switch rhs.1 {
    case let .multiplier(value):
        lhs.greaterThanOrEqual(to: rhs.0, multiplier: value)
    case let .constant(value):
        lhs.greaterThanOrEqual(to: rhs.0, constant: value)
    }
}
