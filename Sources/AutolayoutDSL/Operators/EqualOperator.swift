//
//  EqualOperator.swift
//
//  Created by Álvaro Olave Bañeres on 27/6/23.
//

import Foundation
import UIKit

@discardableResult
public func ==<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: A) -> NSLayoutConstraint {
    return lhs.equal(to: rhs)
}

@discardableResult
public func ==<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: (A, CGFloat)) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.0, offsetBy: rhs.1)
}

@discardableResult
public func ==<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: (A, UILayoutPriority)) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.0, priority: rhs.1)
}

@discardableResult
public func ==<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: ((A, CGFloat), UILayoutPriority)) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.0.0, offsetBy: rhs.0.1, priority: rhs.1)
}

@discardableResult
public func ==<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: (A, UILayoutPriority)) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.0, priority: rhs.1)
}

@discardableResult
public func ==<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: ((A, DimensionOperation), UILayoutPriority)) -> NSLayoutConstraint {
    switch rhs.0.1 {
    case let .multiplier(value):
        return lhs.equal(to: rhs.0.0, multiplier: value, priority: rhs.1)
    case let .constant(value):
        return lhs.equal(to: rhs.0.0, constant: value, priority: rhs.1)
    }
}

/// Used to define one constraint equals to constant value with a dimensional anchor (width, height)
/// Ex. view.layout {
///       $0.height == 100.0
///    }

@discardableResult
public func ==<A: LayoutAnchor>(lhs: LayoutDimensionProperty<A>,
                                rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.equal(to: rhs)
}

@discardableResult
public func ==<A: LayoutAnchor>(lhs: LayoutDimensionProperty<A>,
                                rhs: (CGFloat, UILayoutPriority)) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.0, priority: rhs.1)
}

/// Used to define two constraint equals to constant value with a dimensional anchor (width, height) at the same time
/// Ex. view.layout {
///       ($0.width & $0.height) == (24.0 * 24.0)
///    }

public func ==<A: LayoutAnchor>(lhs: (LayoutDimensionProperty<A>, LayoutDimensionProperty<A>),
                                rhs: (CGFloat, CGFloat)) {
    lhs.0.equal(to: rhs.0)
    lhs.1.equal(to: rhs.1)
}

/// Used to define one constraint equals to other with a dimensional anchor (width, height)
/// Ex. view.layout {
///       $0.height == widthAnchor
///    }

@discardableResult
public func ==<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: A) -> NSLayoutConstraint {
    return lhs.equal(to: rhs)
}

@discardableResult
public func ==<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: (A, DimensionOperation)) -> NSLayoutConstraint {
    switch rhs.1 {
    case let .multiplier(value):
        return lhs.equal(to: rhs.0, multiplier: value)
    case let .constant(value):
        return lhs.equal(to: rhs.0, constant: value)
    }
}
