//
//  Segment.swift
//  SegmentUIKit
//
//  Created by Sereivoan Yong on 2/4/25.
//

import UIKit
import JXSegmentedView
import SegementSlide

public struct Segment {

  public let item: JXSegmentedItem

  public let viewControllerProvider: () -> SegementSlideContentScrollViewDelegate

  public init(title: String, viewControllerProvider: @escaping () -> SegementSlideContentScrollViewDelegate) {
    self.item = .title(title)
    self.viewControllerProvider = viewControllerProvider
  }

  public init(item: JXSegmentedItem, viewControllerProvider: @escaping () -> SegementSlideContentScrollViewDelegate) {
    self.item = item
    self.viewControllerProvider = viewControllerProvider
  }
}
