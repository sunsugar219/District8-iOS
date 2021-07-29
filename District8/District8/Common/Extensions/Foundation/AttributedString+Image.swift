//
//  AttributedString+Image.swift
//  WhatShouldIWear
//
//  Created by mac on 2021. 03. 18..
//  Copyright © 2021. Sunsugar Media. All rights reserved.
//

import Foundation
import  UIKit

extension NSAttributedString {
    
//    ex:
//    let string = NSAttributedString(string: "string with image: @")
//    let imageString = string.add(image: UIImage(named: "image"), size: label.font.capHeight)
//    label.attributedText = imageString
    
    func add(image: UIImage, size: CGFloat) -> NSMutableAttributedString {
        let originalString = self.string
        let parts = originalString.components(separatedBy: "@")
        
        let returnString = NSMutableAttributedString(string: parts[0])
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        imageAttachment.bounds = CGRect(x: 0, y: (size - imageAttachment.image!.size.height).rounded() / 2, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        let imageString = NSAttributedString(attachment: imageAttachment)
        
        returnString.append(imageString)
        
        if parts.count == 2 {
            returnString.append(NSAttributedString(string: parts[1]))
        }
        
        return returnString
    }
}
