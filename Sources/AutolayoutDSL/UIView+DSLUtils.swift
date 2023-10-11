//
//  UIView+DSLUtils.swift
//
//  Created by Álvaro Olave Bañeres on 27/6/23.
//

import Foundation
import UIKit

extension UIView {
    public func layout(using closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: self))
    }
    
    public func fill(_ view: UIView) {
        self.layout {
            $0.top == view.topAnchor
            $0.bottom == view.bottomAnchor
            $0.leading == view.leadingAnchor
            $0.trailing == view.trailingAnchor
        }
    }
    
    public func fillSafeArea(_ view: UIView) {
        self.layout {
            $0.top == view.safeAreaLayoutGuide.topAnchor
            $0.bottom == view.safeAreaLayoutGuide.bottomAnchor
            $0.leading == view.safeAreaLayoutGuide.leadingAnchor
            $0.trailing == view.safeAreaLayoutGuide.trailingAnchor
        }
    }
    
    public func height(_ value: CGFloat) {
        self.layout {
            $0.height == value
        }
    }
    
    public func width(_ value: CGFloat) {
        self.layout {
            $0.width == value
        }
    }
    
    public func centerXin(_ view: UIView, _ padding: CGFloat = 0.0) {
        self.layout {
            $0 -|- (view + padding)
        }
    }
    
    public func centerIn(_ view: UIView) {
        self.layout {
            $0.centerX == view.centerXAnchor
            $0.centerY == view.centerYAnchor
        }
    }
}
