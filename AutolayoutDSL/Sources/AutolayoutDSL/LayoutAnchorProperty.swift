//
//  LayoutAnchorProperty.swift
//
//  Created by Álvaro Olave Bañeres on 27/6/23.
//

import Foundation
import UIKit

public struct LayoutAnchorProperty<Anchor: LayoutAnchor> {
    let anchor: Anchor
    
}

extension LayoutAnchorProperty {
    func equal(to otherAnchor: Anchor,
               offsetBy constant: CGFloat = 0,
               priority: UILayoutPriority = .required) {
        let constraint = anchor.constraint(equalTo: otherAnchor,
                                           constant: constant)
        constraint.priority = priority
        constraint.isActive = true
    }
    
    func greaterThanOrEqual(to otherAnchor: Anchor,
                            offsetBy constant: CGFloat = 0,
                            priority: UILayoutPriority = .required) {
        let constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor,
                                           constant: constant)
        constraint.priority = priority
        constraint.isActive = true
    }
    
    func lessThanOrEqual(to otherAnchor: Anchor,
                         offsetBy constant: CGFloat = 0,
                         priority: UILayoutPriority = .required) {
        let constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor,
                                           constant: constant)
        constraint.priority = priority
        constraint.isActive = true
    }
}
