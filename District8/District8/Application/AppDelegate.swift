//
//  AppDelegate.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 29..
//

import SnapKit
import SwifterSwift
import SwiftyBeaver
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var initializers: [Initializable] = [

    ]

    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializers.forEach { $0.performInitialization() }

        let initialController = BaseNavigationController()
        initialController.setRootWireframe(OverviewWireframe())

        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.window?.rootViewController = initialController
        self.window?.tintColor = .black
        self.window?.makeKeyAndVisible()

        return true
    }

}

