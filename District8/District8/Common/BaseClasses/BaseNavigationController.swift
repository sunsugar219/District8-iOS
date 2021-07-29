//
//  BaseNavigationController.swift
//  BaseProject
//
//  Created by mac on 2021. 02. 10..
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    private var backgroundView: UIView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
navigationBar.largeTitleTextAttributes = textAttributes

        view.backgroundColor = .white
        navigationBar.barTintColor = .white
        navigationBar.backgroundColor = .white
        //navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationBar.frame.size.height = 100.0
//        navigationBar.tintColor = Colors.Blue.Primary
        backgroundView = UIView()
        backgroundView.backgroundColor = .white
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(self.topLayoutGuide.snp.bottom)
        }
    }

func hideBackgroundView(_ hide: Bool = true) {
    backgroundView.isHidden = hide
}
    
    func setClearBackground() {
        view.backgroundColor = .clear
        navigationBar.barTintColor = .clear
        navigationBar.backgroundColor = .clear
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        super.present(viewControllerToPresent, animated: flag, completion: {
//            if let viewController = viewControllerToPresent as? SFSafariViewController {
//                NotificationCenter.default.post(name: Constants.NotificationsEvents.StopButtonAnimation, object: nil)
//            }
        })
    }
}
