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
    
    func fillSafeArea(_ view: UIView) {
        self.layout {
            $0.top == view.safeAreaLayoutGuide.topAnchor
            $0.bottom == view.safeAreaLayoutGuide.bottomAnchor
            $0.leading == view.safeAreaLayoutGuide.leadingAnchor
            $0.trailing == view.safeAreaLayoutGuide.trailingAnchor
        }
    }
    
    func height(_ value: CGFloat) {
        self.layout {
            $0.height == value
        }
    }
    
    func width(_ value: CGFloat) {
        self.layout {
            $0.width == value
        }
    }
    
    func centerXin(_ view: UIView, _ padding: CGFloat = 0.0) {
        self.layout {
            $0 -|- (view + padding)
        }
    }
    
    func centerIn(_ view: UIView) {
        self.layout {
            $0.centerX == view.centerXAnchor
            $0.centerY == view.centerYAnchor
        }
    }
}
