//
//  SegmentedView.swift
//  SegmentUIKit
//
//  Created by Sereivoan Yong on 2/4/25.
//

import UIKit
import JXSegmentedView
import SegementSlide

open class SegmentedView: JXSegmentedView, SegementSlideSwitcherDelegate {

  @objc dynamic open var shadowColor: UIColor? {
    get { return shadowView.backgroundColor }
    set { shadowView.backgroundColor = newValue }
  }

  open var shadowView: UIView = {
    let shadowView = UIView()
    shadowView.backgroundColor = .separator
    return shadowView
  }()

  open override var contentEdgeInsetLeft: CGFloat {
    get { return layoutMargins.left }
    set { }
  }

  open override var contentEdgeInsetRight: CGFloat {
    get { return layoutMargins.right }
    set { }
  }

  open override func layoutSubviews() {
    super.layoutSubviews()

    if shadowView.superview == nil {
      addSubview(shadowView)
    }
    shadowView.frame = CGRect(x: 0, y: bounds.height, width: bounds.width, height: 1 / traitCollection.displayScale)
  }

  open override func layoutMarginsDidChange() {
    super.layoutMarginsDidChange()

    reloadDataWithoutListContainer()
  }

  // MARK: SegementSlideSwitcherDelegate

  weak open var ssDataSource: SegementSlideSwitcherDataSource?

  open var ssDefaultSelectedIndex: Int? {
    get { return defaultSelectedIndex }
    set { defaultSelectedIndex = newValue ?? 0 }
  }

  open var ssSelectedIndex: Int? {
    return selectedIndex
  }

  open var ssScrollView: UIScrollView {
    return collectionView
  }

  open func selectItem(at index: Int, animated: Bool) {
    selectItemAt(index: index)
  }
}
