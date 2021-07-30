//
//  Tag.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 30..
//

import Foundation
import UIKit

class Tag: UIView {
    private var label: UILabel!
    var text: String? {
        didSet {
            if label != nil {
                label.text = text
            }
            switch text {
            case Tags.Delft.rawValue:
                backgroundColor = UIColor(named: "Delft")
            case Tags.Haaglanden.rawValue:
                backgroundColor = UIColor(named: "Haaglanden")
            case Tags.Rotterdam_Rijnmond.rawValue:
                backgroundColor = UIColor(named: "Rotterdam")
            case Tags.Westland.rawValue:
                backgroundColor = UIColor(named: "Westland")
            default:
                backgroundColor = .white
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    convenience init(text: String) {
        self.init(frame: .zero)
        setup()
        self.text = text
    }
    
    private func setup () {
        self.cornerRadius = 4.0.screenScaled
        
        label = UILabel()
        label.textColor = UIColor(named: "White")
        label.font = Fonts.Caption2()
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4.0.screenScaled)
            make.leading.equalToSuperview().offset(8.0.screenScaled)
            make.centerX.centerY.equalToSuperview()
        }
        
    }
}

