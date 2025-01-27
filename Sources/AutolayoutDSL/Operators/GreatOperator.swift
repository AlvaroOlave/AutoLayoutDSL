//
//  GreatOperator.swift
//
//  Created by Álvaro Olave Bañeres on 27/6/23.
//

import Foundation
import UIKit

@discardableResult
public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: A) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs)
}

@discardableResult
public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: (A, CGFloat)) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

@discardableResult
public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: (A, UILayoutPriority)) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs.0, priority: rhs.1)
}

@discardableResult
public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: ((A, CGFloat), UILayoutPriority)) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs.0.0, offsetBy: rhs.0.1, priority: rhs.1)
}

@discardableResult
public func >=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: (A, UILayoutPriority)) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs.0, priority: rhs.1)
}

@discardableResult
public func >=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: ((A, DimensionOperation), UILayoutPriority)) -> NSLayoutConstraint {
    switch rhs.0.1 {
    case let .multiplier(value):
        return lhs.greaterThanOrEqual(to: rhs.0.0, multiplier: value, priority: rhs.1)
    case let .constant(value):
        return lhs.greaterThanOrEqual(to: rhs.0.0, constant: value, priority: rhs.1)
    }
}

@discardableResult
public func >=<A: LayoutAnchor>(lhs: LayoutDimensionProperty<A>,
                                rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs)
}

@discardableResult
public func >=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: A) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs)
}

@discardableResult
public func >=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: (A, DimensionOperation)) -> NSLayoutConstraint {
    switch rhs.1 {
    case let .multiplier(value):
        return lhs.greaterThanOrEqual(to: rhs.0, multiplier: value)
    case let .constant(value):
        return lhs.greaterThanOrEqual(to: rhs.0, constant: value)
    }
}
