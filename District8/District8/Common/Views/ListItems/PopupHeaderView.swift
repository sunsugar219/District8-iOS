//
//  PopupHeaderView.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 31..
//

import Foundation
import UIKit

class PopupHeaderView: UITableViewCell {
    static let cellId: String = "PopupHeaderView"
   
    private var titleLabel: UILabel!
    private var closeButton: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = .white
        initCloseButton()
        initTitleLabel()
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = Fonts.Body1()
        titleLabel.textColor = UIColor(named: "Black")
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14.0.screenScaled)
            make.centerY.centerX.equalToSuperview()
        }
    }
    
    private func initCloseButton() {
        closeButton = UIImageView()
        closeButton.image = UIImage(named: "ic_close")

        addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21.0.screenScaled)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(17.0.screenScaled)
        }
    }
    
    func bind(text: String) {
        titleLabel.text = text
    }
    
}
