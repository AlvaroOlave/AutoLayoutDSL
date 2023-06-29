//
//  LayoutDimension.swift
//
//  Created by Álvaro Olave Bañeres on 27/6/23.
//

import Foundation
import UIKit

public protocol LayoutDimension {
    func constraint(equalToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(equalTo anchor: Self,
                    multiplier: CGFloat,
                    constant: CGFloat) -> NSLayoutConstraint
    
    func constraint(greaterThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self,
                    multiplier: CGFloat,
                    constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self,
                    multiplier: CGFloat,
                    constant: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutDimension: LayoutDimension {}
