//
//  Fonts.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 29..
//

import UIKit

class Fonts: NSObject {
    static func SemiBold(size: CGFloat) -> UIFont {
        UIFont(name: "Inter-SemiBold", size: size)!
    }
    
    static func Regular(size: CGFloat) -> UIFont {
        UIFont(name: "Inter-Regular", size: size)!
    }
    
    static func Medium(size: CGFloat) -> UIFont {
        UIFont(name: "Inter-Medium", size: size)!
    }
    
    static func Headline() -> UIFont {
        UIFont(name: "Inter-SemiBold", size: 17)!
    }
    
    static func Caption1() -> UIFont {
        UIFont(name: "Inter-SemiBold", size: 12)!
    }
    
    static func Body1() -> UIFont {
        UIFont(name: "Inter-Medium", size: 15)!
    }
    
    static func Caption2() -> UIFont {
        UIFont(name: "Inter-Regular", size: 12)!
    }
    static func Body2(size: CGFloat = 15 ) -> UIFont {
        UIFont(name: "Inter-Regular", size: size)!
    }
}
