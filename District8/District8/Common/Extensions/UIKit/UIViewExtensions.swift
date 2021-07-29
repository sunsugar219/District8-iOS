//
//  UIViewExtensions.swift
//  YourStylist
//
//  Created by Hodi Zsuzsa on 2021. 04. 01..
//  Copyright © 2021. Sunsugar Media. All rights reserved.
//

import UIKit
enum AnglesIn {
    case degrees
    case radians
}

extension UIView {
    func rotate(angleNr: CGFloat, unit: AnglesIn, animated: Bool = true, duration: TimeInterval = Constants.UIConstants.AnimationDuration, completion: ((Bool) ->Void)? = nil) {
        let angle = unit == .degrees ?  (.pi * angleNr / 180.0) : angleNr
        let length = animated ? duration : 0
        UIView.animate(withDuration: length, delay: 0, options: AnimationOptions.curveLinear, animations: { () -> Void in
            self.transform = self.transform.rotated(by: angle)
        }, completion: completion)
    }
}
