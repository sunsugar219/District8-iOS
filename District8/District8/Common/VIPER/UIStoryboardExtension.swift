//
//  UIStoryboardExtension.swift
//  BaseProject
//
//  Created by mac on 2021. 02. 10..
//

import UIKit

extension UIStoryboard {

    func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }

}
