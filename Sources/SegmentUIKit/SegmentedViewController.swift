//
//  SegmentedViewController.swift
//  SegmentUIKit
//
//  Created by Sereivoan Yong on 2/4/25.
//

import UIKit
import JXSegmentedView
import SegementSlide

open class SegmentedViewController: SegementSlideViewController, JXSegmentedViewDelegate {

  lazy open private(set) var segmentedViewDataSource: SegmentedViewStaticDataSource = {
    let dataSource = SegmentedViewStaticDataSource()
    dataSource.itemSpacing = 20
    dataSource.isItemSpacingAverageEnabled = false
    dataSource.isSelectedAnimable = true
    dataSource.items = segments.map(\.item)
    configure(dataSource)
    return dataSource
  }()


  lazy open private(set) var segmentedView: SegmentedView = {
    let indicatorView = SegmentedIndicatorView()
    indicatorView.indicatorHeight = 2
    let segmentedView = SegmentedView()
    segmentedView.indicators = [indicatorView]
    segmentedView.ssDataSource = segmentedViewDataSource
    segmentedView.dataSource = segmentedViewDataSource
    segmentedView.delegate = self
    return segmentedView
  }()

  open var segments: [Segment] = [] {
    didSet {
      segmentedViewDataSource.items = segments.map(\.item)
      guard isViewLoaded else { return }
      defaultSelectedIndex = preferredIndexToSelect(for: segments)
      reloadData()
    }
  }

  // MARK: Segmented View Component Providing

  open func configure(_ segmentedViewDataSource: SegmentedViewStaticDataSource) {
  }

  open override func segementSlideHeaderView() -> UIView? {
    return nil
  }
  
  open override func segementSlideSwitcherView() -> any SegementSlideSwitcherDelegate {
    return segmentedView
  }

  open override func segementSlideContentViewController(at index: Int) -> (any SegementSlideContentScrollViewDelegate)? {
    return segments[index].viewControllerProvider()
  }

  // MARK: Segmented View Lifecycle

  open override func setupSwitcher() {
    super.setupSwitcher()

    segmentedView.contentScrollView = contentView.scrollView
  }

  open func preferredIndexToSelect(for segments: [Segment]) -> Int? {
    return segments.indices.first
  }

  // MARK: View Lifecycle

  open override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground

    scrollView.backgroundColor = .systemBackground
    scrollView.clipsToBounds = false
    scrollView.preservesSuperviewLayoutMargins = true

    headerView.preservesSuperviewLayoutMargins = true

    contentView.backgroundColor = .systemBackground
    contentView.preservesSuperviewLayoutMargins = true
    contentView.scrollView.preservesSuperviewLayoutMargins = true

    switcherView.preservesSuperviewLayoutMargins = true

    defaultSelectedIndex = preferredIndexToSelect(for: segments)
    reloadData()
  }

  // MARK: JXSegmentedViewDelegate

  open func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
    contentView.selectItem(at: index, animated: true)
  }
}
