//
//  FeaturedArticle.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 30..
//

import Foundation
import UIKit

class FeaturedArticle: UITableViewCell {
    static let cellId: String = "FeaturedArticle"

    private var mainImage: UIImageView!
    private var containerView: UIView!
    private var title: UILabel!
    private var placeTag: Tag!
    private var subtitle: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup () {
        initMainImage()
        initContainerView()
        initTitle()
        initPlaceTag()
        initSubtitle()
    }
    
    private func initMainImage() {
        mainImage = UIImageView()
        mainImage.contentMode = .scaleAspectFit
        
        addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.center.top.leading.height.equalToSuperview()
            make.width.equalTo(mainImage.snp.height).multipliedBy(2/3)

        }
    }
    
    private func initContainerView() {
        containerView = UIView()
        containerView.backgroundColor = UIColor(named: "FeaturedShadow")
        
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.bottom.leading.centerX.equalToSuperview()
        }
    }
    
    private func initTitle() {
        title = UILabel()
        title.font = Fonts.Headline()
        title.textColor = UIColor(named: "White")
        title.numberOfLines = 2
        title.lineBreakMode = .byTruncatingTail
        
        containerView.addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(11.0.screenScaled)
            make.leading.equalToSuperview().offset(16.0.screenScaled)
            make.centerX.equalToSuperview()
        }
    }
    
    private func initPlaceTag() {
        placeTag = Tag()
        
        containerView.addSubview(placeTag)
        placeTag.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(8.0.screenScaled)
            make.leading.equalToSuperview().offset(16.0.screenScaled)
            make.bottom.equalToSuperview().offset(-16.0.screenScaled)
        }
    }
    
    private func initSubtitle() {
        subtitle = UILabel()
        subtitle.textColor = UIColor(named: "White")
        subtitle.font = Fonts.Caption2()
        
        containerView.addSubview(subtitle)
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(12.0.screenScaled)
            make.bottom.equalToSuperview().offset(-20.0.screenScaled)
            make.centerY.equalTo(placeTag)
            make.leading.equalTo(placeTag.snp.trailing).offset(8.0.screenScaled)
        }
        
    }
    
    func bind(model:NewsModel) {
        title.text = model.title?.text
//        placeTag.text = model.place
        subtitle.text = model.date
//        if let remoteImg = model.image {
//            mainImage.downloaded(from: remoteImg)
//        }
    }
    
}

