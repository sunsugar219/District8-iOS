//
//  ExampleViewController.swift
//  BaseProject
//
//  Created by mac on 2021. 02. 08..
//  Copyright (c) 2021. ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ExampleViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: ExamplePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

}

// MARK: - Extensions -

extension ExampleViewController: ExampleViewInterface {
}