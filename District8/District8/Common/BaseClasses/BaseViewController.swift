//
//  BaseViewController.swift
//  BaseProject
//
//  Created by mac on 2021. 02. 10..
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    private var statusBarView: UIView!
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        view.backgroundColor = .white
//        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.prefersLargeTitles = false
//        navigationController?.navigationItem.largeTitleDisplayMode = .never
//        navigationController?.navigationBar.barTintColor = .black
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWhiteStatusbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setWhiteStatusbar()
    }
    
    @objc
    private func appFromBackground() {
        setWhiteStatusbar()
    }
    
    func removeStatusBarView() {
        statusBarView = nil
    }
    
    private func setWhiteStatusbar() {
        if #available(iOS 13.0, *) {

                    let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
                    let statusBarFrame = window?.windowScene?.statusBarManager?.statusBarFrame

                    statusBarView = UIView(frame: statusBarFrame!)
                    self.view.addSubview(statusBarView)
            statusBarView.backgroundColor = .white
                } else {
                    //Below iOS13
                    let statusBarFrame = UIApplication.shared.statusBarFrame
                    statusBarView = UIView(frame: statusBarFrame)
                    self.view.addSubview(statusBarView)
                    statusBarView.backgroundColor = .white
                }
    }
}
