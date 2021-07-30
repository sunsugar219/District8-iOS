//
//  BaseViewController.swift
//  BaseProject
//
//  Created by mac on 2021. 02. 10..
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.barTintColor = .black
    }
}
