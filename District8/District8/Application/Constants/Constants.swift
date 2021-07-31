//
//  Constants.swift
//  WhatShouldIWear
//
//  Created by mac on 2021. 02. 24..
//

import UIKit

let kAppDelegate = UIApplication.shared.delegate as! AppDelegate

struct Constants {
    
    struct UIConstants {
        static let AnimationDuration = 0.3
    }
    
    struct UserDefaults {
        static let TextSize = "TextSize"
        
    }
    
    struct Notifications {
        static let TextSizeChanged = NSNotification.Name("TextSizeChanged")

    }
    
}
