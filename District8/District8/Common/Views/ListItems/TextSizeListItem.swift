//
//  TextSizeListItem.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 30..
//

import Foundation
import UIKit

class TextSizeListItem: UITableViewCell {
    static let cellId: String = "TextSizeListItem"
   
    private var titleLabel: UILabel!
    private var checkmark: UIImageView!
    private var separator: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        initTitleLabel()
        initCheckmark()
        initSeparator()
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = Fonts.Body2()
        if self.isSelected {
            titleLabel.textColor = UIColor(named: "Delft")
        } else {
            titleLabel.textColor = UIColor(named: "Black")
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16.0.screenScaled)
            make.centerY.equalToSuperview()
        }
    }
    
    private func initCheckmark() {
        checkmark = UIImageView()
        checkmark.contentMode = .scaleAspectFit
        checkmark.alpha = 0
        checkmark.image = UIImage(named: "ic_check")?.tint(UIColor(named: "Delft") ?? .blue, blendMode: .destinationAtop)
        
        addSubview(checkmark)
        checkmark.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16.0.screenScaled)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16.0.screenScaled)
            make.leading.equalTo(titleLabel.snp.trailing)
        }
    }
    
    private func initSeparator() {
        separator = UIView()
        separator.backgroundColor = UIColor(named: "LightGrey")
        
        addSubview(separator)
        separator.snp.makeConstraints { make in
            make.bottom.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(16.0.screenScaled)
            make.height.equalTo(1.0.screenScaled)
        }
    }
    func hideSeparator() {
        separator.alpha = 0
    }
        
    func bind(text: String) {
        titleLabel.text = text
        if let saved = UserDefaults.standard.string(forKey: Constants.UserDefaults.TextSize), saved == text {
            checkmark.alpha = 1
            titleLabel.textColor = UIColor(named: "Delft")
        } else {
            checkmark.alpha = 0
            titleLabel.textColor = UIColor(named: "Black")
        }
    }
    
}
