//
//  SegementSlideSwitcherDelegate.swift
//  SegementSlide
//
//  Created by Jiar on 2020/5/5.
//

import UIKit
#if canImport(Kingfisher)
import Kingfisher
#endif

public protocol SegementSlideSwitcherDataSource: AnyObject {
    var height: CGFloat { get }
    var items: [SegementSlideSwitcherItem] { get }
}

public protocol SegementSlideSwitcherDelegate: UIView {
    var ssDataSource: SegementSlideSwitcherDataSource? { get set }
    var ssDefaultSelectedIndex: Int? { get set }
    var ssSelectedIndex: Int? { get }
    var ssScrollView: UIScrollView { get }
    
    func reloadData()
    func selectItem(at index: Int, animated: Bool)
}

internal final class SegementSlideSwitcherEmptyView: UIView, SegementSlideSwitcherDelegate {
    weak var ssDataSource: SegementSlideSwitcherDataSource? = nil
    var ssDefaultSelectedIndex: Int? = nil
    var ssSelectedIndex: Int? = nil
    var ssScrollView: UIScrollView = UIScrollView()
    
    func reloadData() {
        
    }
    
    func selectItem(at index: Int, animated: Bool) {
        
    }
}

public enum SegementSlideSwitcherItem {

    case title(String)
#if canImport(Kingfisher)
    case image(Source?, Placeholder? = nil)
    case titleImage(String, Source?, Placeholder? = nil)
#else
    case image(UIImage?)
    case titleImage(String, UIImage?)
#endif
    case titleBadgeNumber(String, Int)
    case titleDot(String, Bool)
    case attributedTitle(NSAttributedString)

    public var title: String? {
        switch self {
        case .title(let title):
            return title
        case .image:
            return nil
#if canImport(Kingfisher)
        case .titleImage(let title, _, _):
            return title
#else
        case .titleImage(let title, _):
          return title
#endif
        case .titleBadgeNumber(let title, _):
            return title
        case .titleDot(let title, _):
            return title
        case .attributedTitle:
            return nil
        }
    }

#if canImport(Kingfisher)
    public var imageSource: Source? {
        switch self {
        case .title:
            return nil
        case .image(let source, _):
            return source
        case .titleImage(_, let source, _):
            return source
        case .titleBadgeNumber:
            return nil
        case .titleDot:
            return nil
        case .attributedTitle:
            return nil
        }
    }

    public var imagePlaceholder: Placeholder? {
        switch self {
        case .title:
            return nil
        case .image(_, let placeholder):
            return placeholder
        case .titleImage(_, _, let placeholder):
            return placeholder
        case .titleBadgeNumber:
            return nil
        case .titleDot:
            return nil
        case .attributedTitle:
            return nil
        }
    }
#else

    public var image: UIImage? {
        switch self {
        case .title:
            return nil
        case .image(let image):
            return image
        case .titleImage(_, let image):
            return image
        case .titleBadgeNumber:
            return nil
        case .titleDot:
            return nil
        case .attributedTitle:
            return nil
        }
    }
#endif

    public var badgeNumber: Int? {
        switch self {
        case .title:
            return nil
        case .image:
            return nil
        case .titleImage:
            return nil
        case .titleBadgeNumber(_, let badgeNumber):
            return badgeNumber
        case .titleDot:
            return nil
        case .attributedTitle:
            return nil
        }
    }

    public var showsDot: Bool? {
        switch self {
        case .title:
            return nil
        case .image:
            return nil
        case .titleImage:
            return nil
        case .titleBadgeNumber:
            return nil
        case .titleDot(_, let showsDot):
            return showsDot
        case .attributedTitle:
            return nil
        }
    }

    public var attributedTitle: NSAttributedString? {
        switch self {
        case .title:
            return nil
        case .image:
            return nil
        case .titleImage:
            return nil
        case .titleBadgeNumber:
            return nil
        case .titleDot:
            return nil
        case .attributedTitle(let attributedTitle):
            return attributedTitle
        }
    }
}
