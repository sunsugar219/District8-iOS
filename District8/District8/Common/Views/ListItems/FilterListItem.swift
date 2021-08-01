//
//  FilterListItem.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 08. 01..
//

import Foundation
import UIKit

class FilterListItem: UITableViewCell {
    static let cellId: String = "FilterListItem"
   
    private var checkbox: UIImageView!
    private var titleLabel: UILabel!
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
        initCheckbox()
        initTitleLabel()
        initSeparator()
    }
    
    private func initCheckbox() {
        checkbox = UIImageView()
        checkbox.contentMode = .scaleAspectFit
        if self.isSelected {
            checkbox.image = UIImage(named: "ic_check_box_filled")?.tint(UIColor(named: "Delft") ?? .blue, blendMode: .destinationAtop)
        } else {
            checkbox.image = UIImage(named: "ic_check_box_blank")
        }
        
        addSubview(checkbox)
        checkbox.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17.0.screenScaled)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(18.0.screenScaled)
            make.leading.equalToSuperview().offset(19.0.screenScaled)
        }
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
            make.top.equalToSuperview().offset(16.0.screenScaled)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(56.0.screenScaled)
            make.trailing.equalToSuperview().offset(-19.0.screenScaled)
        }
    }
    
    private func initSeparator() {
        separator = UIView()
        separator.backgroundColor = UIColor(named: "LightGrey")
        
        addSubview(separator)
        separator.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16.0.screenScaled)
            make.height.equalTo(1.0.screenScaled)
            make.leading.equalTo(titleLabel)
        }
    }
    func hideSeparator() {
        separator.alpha = 0
    }
        
    func bind(text: String) {
        titleLabel.text = text
        if let filters = UserDefaults.standard.stringArray(forKey: Constants.UserDefaults.Filters), filters.contains(text) {
            checkbox.image = UIImage(named: "ic_check_box_filled")?.tint(UIColor(named: "Delft") ?? .blue, blendMode: .destinationAtop)
            titleLabel.textColor = UIColor(named: "Delft")
        } else {
            checkbox.image = UIImage(named: "ic_check_box_blank")
            titleLabel.textColor = UIColor(named: "Black")
        }
    }
    
}
