//
//  SegmentedIndicatorView.swift
//  SegmentUIKit
//
//  Created by Sereivoan Yong on 2/8/25.
//

import UIKit
import JXSegmentedView

open class SegmentedIndicatorView: JXSegmentedIndicatorLineView {

  open override func commonInit() {
    super.commonInit()

    indicatorColor = tintColor
  }
  
  open override func tintColorDidChange() {
    super.tintColorDidChange()

    indicatorColor = tintColor
    backgroundColor = tintColor
  }
}
