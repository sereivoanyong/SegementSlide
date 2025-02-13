//
//  SegmentedViewTitleDataSource.swift
//  SegmentUIKit
//
//  Created by Sereivoan Yong on 2/4/25.
//

import UIKit
import JXSegmentedView
import SegementSlide

open class SegmentedViewStaticDataSource: JXSegmentedItemDataSource, SegementSlideSwitcherDataSource {

  open var axis: NSLayoutConstraint.Axis = .horizontal {
    didSet {
      switch axis {
      case .horizontal:
        titleImageType = .leftImage
        titleImageSpacing = 5
      case .vertical:
        titleImageType = .topImage
        titleImageSpacing = 2
      @unknown default:
        titleImageType = .leftImage
        titleImageSpacing = 5
      }
    }
  }

  open var height: CGFloat {
    switch axis {
    case .horizontal:
      return 44
    case .vertical:
      return 60
    @unknown default:
      return 44
    }
  }
}
