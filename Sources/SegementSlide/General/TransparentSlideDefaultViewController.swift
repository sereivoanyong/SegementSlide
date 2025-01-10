//
//  TransparentSlideDefaultViewController.swift
//  SegementSlide
//
//  Created by Jiar on 2020/5/6.
//

import UIKit

open class TransparentSlideDefaultViewController: TransparentSlideViewController {
    
    private let defaultSwitcherView = SegementSlideDefaultSwitcherView()
    
    public override func segementSlideSwitcherView() -> SegementSlideSwitcherDelegate {
        defaultSwitcherView.delegate = self
        defaultSwitcherView.ssDataSource = self
        return defaultSwitcherView
    }
    
    open override func setupSwitcher() {
        super.setupSwitcher()
        defaultSwitcherView.config = switcherConfig
    }
    
    open var switcherConfig: SegementSlideDefaultSwitcherConfig {
        return SegementSlideDefaultSwitcherConfig.shared
    }
    
    open override var switcherHeight: CGFloat {
        return 44
    }
    
    open var itemsInSwitcher: [SegementSlideSwitcherItem] {
        return []
    }
    
    open func showBadgeInSwitcher(at index: Int) -> BadgeType {
        return .none
    }
    
    /// reload badges in SwitcherView
    public func reloadBadgeInSwitcher() {
        defaultSwitcherView.reloadBadges()
    }
    
}

extension TransparentSlideDefaultViewController: SegementSlideSwitcherDataSource {
    
    public var height: CGFloat {
        return switcherHeight
    }
    
    public var items: [SegementSlideSwitcherItem] {
        return itemsInSwitcher
    }
    
}

extension TransparentSlideDefaultViewController: SegementSlideDefaultSwitcherViewDelegate {
    
    public var itemsInSegementSlideSwitcherView: [SegementSlideSwitcherItem] {
        return switcherView.ssDataSource?.items ?? []
    }
    
    public func segementSwitcherView(_ segementSlideSwitcherView: SegementSlideDefaultSwitcherView, didSelectAtIndex index: Int, animated: Bool) {
        if contentView.selectedIndex != index {
            contentView.selectItem(at: index, animated: animated)
        }
    }
    
    public func segementSwitcherView(_ segementSlideSwitcherView: SegementSlideDefaultSwitcherView, showBadgeAtIndex index: Int) -> BadgeType {
        return showBadgeInSwitcher(at: index)
    }
    
}
