//
//  SegementSlideHeaderView.swift
//  SegementSlide
//
//  Created by Jiar on 2018/12/7.
//  Copyright © 2018 Jiar. All rights reserved.
//

import UIKit

public protocol SegementSlideHeaderViewDelegate: AnyObject {

    func headerView(_ headerView: SegementSlideHeaderView, remove view: UIView)
    func headerView(_ headerView: SegementSlideHeaderView, add view: UIView)
}

public class SegementSlideHeaderView: UIView {
    
    private weak var lastHeaderView: UIView?
    weak var contentView: SegementSlideContentView?

    weak var delegate: SegementSlideHeaderViewDelegate?

    internal func config(_ headerView: UIView?) {
        guard headerView != lastHeaderView else {
            return
        }
        if let lastHeaderView {
            delegate?.headerView(self, remove: lastHeaderView)
        }
        if let headerView {
            delegate?.headerView(self, add: headerView)
            lastHeaderView = headerView
        }
    }
    
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        guard let contentView else {
            return view
        }
        guard let selectedIndex = contentView.selectedIndex,
            let delegate = contentView.dequeueReusableViewController(at: selectedIndex) else {
            return view
        }
        if view is UIControl {
            return view
        }
        if !(view?.gestureRecognizers?.isEmpty ?? true) {
            return view
        }
        return delegate.scrollView
    }
    
}
