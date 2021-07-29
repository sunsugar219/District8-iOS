//
//  ScreenScale.swift
//  WhatShouldIWear
//
//  Created by mac on 2021. 03. 17..
//  Copyright © 2021. Sunsugar Media. All rights reserved.
//

import UIKit

extension CGFloat {
    
    public var screenScaled: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return self * 1.33
        } else {
            return self
        }
    }
}

extension Double {
    
    public var screenScaled: CGFloat {
        CGFloat(self).screenScaled
    }
}
