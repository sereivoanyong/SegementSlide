//
//  SegementSlideScrollView.swift
//  SegementSlide
//
//  Created by Jiar on 2019/1/16.
//  Copyright © 2019 Jiar. All rights reserved.
//

import UIKit

public class SegementSlideScrollView: UIScrollView, UIGestureRecognizerDelegate {
    
    var otherGestureRecognizers: [UIGestureRecognizer] = []
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if otherGestureRecognizers.contains(otherGestureRecognizer) {
            return false
        }
        return true
    }
    
}
