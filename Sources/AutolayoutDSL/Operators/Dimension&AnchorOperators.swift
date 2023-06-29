//
//  DimensionOperators.swift
//
//  Created by Álvaro Olave Bañeres on 27/6/23.
//

import Foundation
import UIKit

public enum DimensionOperation {
    case multiplier(CGFloat)
    case constant(CGFloat)
}

public func +<A: LayoutDimension>(lhs: A,
                                  rhs: CGFloat) -> (A, DimensionOperation) {
    return (lhs, .constant(rhs))
}

public func +<A: LayoutAnchor>(lhs: A,
                               rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}

public func -<A: LayoutAnchor>(lhs: A,
                               rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, -rhs)
}

public func -<A: LayoutDimension>(lhs: A,
                                  rhs: CGFloat) -> (A, DimensionOperation) {
    return (lhs, .constant(-rhs))
}

public func *<A: LayoutDimension>(lhs: A,
                                  rhs: CGFloat) -> (A, DimensionOperation) {
    return (lhs, .multiplier(rhs))
}

public func +(lhs: UIView,
              rhs: CGFloat) -> (UIView, CGFloat) {
    return (lhs, rhs)
}

public func &<A: LayoutAnchor>(lhs: LayoutDimensionProperty<A>,
                               rhs: LayoutDimensionProperty<A>) -> (LayoutDimensionProperty<A>, LayoutDimensionProperty<A>) {
    return (lhs, rhs)
}

public func *(lhs: CGFloat,
              rhs: CGFloat) -> (CGFloat, CGFloat) {
    return (lhs, rhs)
}
