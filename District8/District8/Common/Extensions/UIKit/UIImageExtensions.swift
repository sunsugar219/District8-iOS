//
//  UIImageExtensions.swift
//  WhatShouldIWear
//
//  Created by mac on 2021. 02. 25..
//  Copyright © 2021. Sunsugar Media. All rights reserved.
//

import UIKit

extension UIImage {
    func tint(_ color: UIColor, blendMode: CGBlendMode) -> UIImage {
        let drawRect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        color.setFill()
        context?.fill(drawRect)
        draw(in: drawRect, blendMode: blendMode, alpha: 1.0)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    func resize(toHeight: CGFloat) -> UIImage {
        let scale = toHeight / self.size.height
        let newWidth = self.size.width * scale
        let newSize = CGSize(width: newWidth, height: toHeight)
        return UIGraphicsImageRenderer(size: newSize).image{_ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
    
    func resize(toWidth: CGFloat) -> UIImage {
        let scale = toWidth / self.size.width
        let newHeight = self.size.height * scale
        let newSize = CGSize(width: toWidth, height: newHeight)
        return UIGraphicsImageRenderer(size: newSize).image{_ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
    
    func getSavedImage(named: String) -> UIImage? {
          let documentDirectory = FileManager.SearchPathDirectory.documentDirectory

            let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
            let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)

            if let dirPath = paths.first {
                let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(named)
                let image = UIImage(contentsOfFile: imageUrl.path)
                return image

            }

            return nil
    }


}
