//
//  PriorityOperator.swift
//
//  Created by Álvaro Olave Bañeres on 27/6/23.
//

import Foundation
import UIKit

infix operator ~: RangeFormationPrecedence

public func ~<A: LayoutAnchor>(lhs: A,
                        rhs: CGFloat) -> (A, UILayoutPriority) {
    return (lhs, UILayoutPriority(Float(rhs)))
}

public func ~<A: LayoutAnchor>(lhs: A,
                        rhs: UILayoutPriority) -> (A, UILayoutPriority) {
    return (lhs, rhs)
}

public func ~<A: LayoutAnchor>(lhs: (A, CGFloat),
                        rhs: CGFloat) -> ((A, CGFloat), UILayoutPriority) {
    return (lhs, UILayoutPriority(Float(rhs)))
}

public func ~<A: LayoutAnchor>(lhs: (A, CGFloat),
                        rhs: UILayoutPriority) -> ((A, CGFloat), UILayoutPriority) {
    return (lhs, rhs)
}

public func ~<A: LayoutDimension>(lhs: (A, DimensionOperation),
                           rhs: CGFloat) -> ((A, DimensionOperation), UILayoutPriority) {
    return (lhs, UILayoutPriority(Float(rhs)))
}

public func ~<A: LayoutDimension>(lhs: (A, DimensionOperation),
                           rhs: UILayoutPriority) -> ((A, DimensionOperation), UILayoutPriority) {
    return (lhs, rhs)
}
