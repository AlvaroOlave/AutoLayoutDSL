//
//  LayoutProxy.swift
//
//  Created by Álvaro Olave Bañeres on 27/6/23.
//

import Foundation
import UIKit

public final class LayoutProxy {
    public lazy var leading = property(with: view.leadingAnchor)
    public lazy var trailing = property(with: view.trailingAnchor)
    public lazy var top = property(with: view.topAnchor)
    public lazy var bottom = property(with: view.bottomAnchor)
    public lazy var centerX = property(with: view.centerXAnchor)
    public lazy var centerY = property(with: view.centerYAnchor)
    public lazy var width = dimension(with: view.widthAnchor)
    public lazy var height = dimension(with: view.heightAnchor)
    
    private let view: UIView
    
    lazy var returnableConstraints: [NSLayoutConstraint] = []
    
    init(view: UIView) {
        self.view = view
    }
    
    func centerXin(_ view: UIView, padding: CGFloat = 0.0) {
        self.leading == view.leadingAnchor + padding
        self.trailing == view.trailingAnchor - padding
    }
    
    func centerYin(_ view: UIView, padding: CGFloat = 0.0) {
        self.top == view.topAnchor + padding
        self.bottom == view.bottomAnchor - padding
    }
    
    public func returnable(_ constraint: NSLayoutConstraint) {
        returnableConstraints.append(constraint)
    }
    
    private func property<A: LayoutAnchor>(with anchor: A) -> LayoutAnchorProperty<A> {
        return LayoutAnchorProperty(anchor: anchor)
    }
    
    private func dimension<A: LayoutDimension>(with anchor: A) -> LayoutDimensionProperty<A> {
        return LayoutDimensionProperty(anchor: anchor)
    }
}
