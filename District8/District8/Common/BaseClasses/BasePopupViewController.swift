//
//  BasePopupViewController.swift
//  BaseProject
//
//  Created by mac on 2021. 02. 10..
//

import Foundation
import UIKit

class BasePopUpViewController: BaseViewController {
    
    var containerView: UIView!
    private var transparentView: UIView!
    private var isAlreadySetup: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        if !isAlreadySetup {
            isAlreadySetup = true
            setup()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        removeStatusBarView()
    }
    
    private func setup() {
        initTransparentView()
        initContainerView()
        initNotifications()
    }
    
    private func initNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    private func initTransparentView() {
        transparentView = UIView()
        transparentView.backgroundColor = UIColor(named: "Overlay")
        view.addSubview(transparentView)
        transparentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func initContainerView() {
        containerView = UIView()
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view == containerView {
            transparentViewTapped()
        }
    }
    
    @objc
    func transparentViewTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            let height = keyboardSize.height
            
            UIView.animate(withDuration: Constants.UIConstants.AnimationDuration) {
                self.containerView.snp.updateConstraints { make in
                    make.top.leading.trailing.equalToSuperview()
                    make.bottom.equalToSuperview().offset(-height)
                }
                
                self.view.superview?.layoutIfNeeded()
            }
            
        }
        
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            
            UIView.animate(withDuration: Constants.UIConstants.AnimationDuration) {
                self.containerView.snp.updateConstraints { make in
                    make.top.leading.trailing.bottom.equalToSuperview()
                }
                
                self.view.superview?.layoutIfNeeded()
            }
            
        }
    }
    
}
