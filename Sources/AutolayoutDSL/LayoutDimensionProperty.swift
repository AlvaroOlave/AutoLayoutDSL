//
//  LayoutDimensionProperty.swift
//
//  Created by Álvaro Olave Bañeres on 27/6/23.
//

import Foundation
import UIKit

public struct LayoutDimensionProperty<Anchor: LayoutDimension> {
    let anchor: Anchor
}

extension LayoutDimensionProperty {
    @discardableResult
    func equal(to constant: CGFloat,
               priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(equalToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func greaterThanOrEqual(to constant: CGFloat,
                            priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func lessThanOrEqual(to constant: CGFloat,
                         priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func equal(to otherDimension: Anchor,
               multiplier: CGFloat = 1.0,
               constant: CGFloat = 0.0,
               priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(equalTo: otherDimension,
                                           multiplier: multiplier,
                                           constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func greaterThanOrEqual(to otherDimension: Anchor,
                            multiplier: CGFloat = 1.0,
                            constant: CGFloat = 0.0,
                            priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualTo: otherDimension,
                                           multiplier: multiplier,
                                           constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func lessThanOrEqual(to otherDimension: Anchor,
                         multiplier: CGFloat = 1.0,
                         constant: CGFloat = 0.0,
                         priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualTo: otherDimension,
                                           multiplier: multiplier,
                                           constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
}
