//
//  UICollectionViewExtensions.swift
//  YourStylist
//
//  Created by Hodi Zsuzsa on 2021. 04. 13..
//  Copyright © 2021. Sunsugar Media. All rights reserved.
//

import Foundation
import UIKit
extension UICollectionView {
    func showEmptyView(text: String, withImage: Bool = true) {
        let container = UIView()
        container.backgroundColor = .clear
        container.layer.borderWidth = 4.0.screenScaled
        if #available(iOS 13.0, *) {
            container.layer.borderColor = UIColor(named: "accent")?.resolvedColor(with: traitCollection).cgColor
        } else {
            container.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "empty")
        imageView.isHidden = !withImage
        container.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20.0.screenScaled)
            make.height.equalTo(withImage ? 100.0.screenScaled : 0)
            make.centerX.equalToSuperview()
        }
        
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor(named: "primaryPink")
        label.text = text
        container.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(8.0.screenScaled)
            make.leading.equalToSuperview().offset(40.0.screenScaled)
        }
        backgroundView = container
    }
    
    func hideEmptyview() {
        backgroundView = nil
    }
}
