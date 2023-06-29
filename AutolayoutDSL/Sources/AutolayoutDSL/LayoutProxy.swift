//
//  LayoutProxy.swift
//
//  Created by Álvaro Olave Bañeres on 27/6/23.
//

import Foundation
import UIKit

public final class LayoutProxy {
    lazy var leading = property(with: view.leadingAnchor)
    lazy var trailing = property(with: view.trailingAnchor)
    lazy var top = property(with: view.topAnchor)
    lazy var bottom = property(with: view.bottomAnchor)
    lazy var centerX = property(with: view.centerXAnchor)
    lazy var centerY = property(with: view.centerYAnchor)
    lazy var width = dimension(with: view.widthAnchor)
    lazy var height = dimension(with: view.heightAnchor)
    
    private let view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    func centerXin(_ view: UIView, padding: CGFloat = 0.0) {
//        self.leading == view.leadingAnchor + padding
//        self.trailing == view.trailingAnchor - padding
    }
    
    func centerYin(_ view: UIView, padding: CGFloat = 0.0) {
//        self.top == view.topAnchor + padding
//        self.bottom == view.bottomAnchor - padding
    }
    
    private func property<A: LayoutAnchor>(with anchor: A) -> LayoutAnchorProperty<A> {
        return LayoutAnchorProperty(anchor: anchor)
    }
    
    private func dimension<A: LayoutDimension>(with anchor: A) -> LayoutDimensionProperty<A> {
        return LayoutDimensionProperty(anchor: anchor)
    }
}
