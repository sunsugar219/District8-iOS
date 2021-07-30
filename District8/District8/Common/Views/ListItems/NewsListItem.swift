//
//  NewsListItem.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 30..
//

import Foundation
import UIKit

class NewsListItem: UITableViewCell {
    static let cellId: String = "NewsListItem"
    
    private var newsImageView: UIImageView!
    private var textWrapperView: UIView!
    private var titleLabel: UILabel!
    private var subtitleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        initNewsImageView()
        initTextWrapperView()
        initTitleLabel()
        initSubtitleLabel()
    }
    
    private func initNewsImageView() {
        newsImageView = UIImageView()
        newsImageView.contentMode = .scaleAspectFit
        
        addSubview(newsImageView)
        newsImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8.0.screenScaled)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16.0.screenScaled)
            make.width.equalTo(110.0.screenScaled)
            make.height.equalTo(75.0.screenScaled)
        }
    }
    
    private func initTextWrapperView() {
        textWrapperView = UIView()
        
        addSubview(textWrapperView)
        textWrapperView.snp.makeConstraints { make in
            make.leading.equalTo(newsImageView.snp.trailing).offset(16.0.screenScaled)
            make.centerY.equalToSuperview()
            make.height.equalTo(60.0.screenScaled)
            make.trailing.equalToSuperview().offset(-16.0.screenScaled)

        }
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.font = Fonts.Body1()
        titleLabel.textColor = UIColor(named: "Black")
        
        textWrapperView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.centerX.equalToSuperview()
        }
    }
    
    private func initSubtitleLabel() {
        subtitleLabel = UILabel()
        subtitleLabel.numberOfLines = 1
        subtitleLabel.font = Fonts.Caption2()
        subtitleLabel.textColor = UIColor(named: "DarkGrey")
        
        textWrapperView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.bottom.leading.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(4.0.screenScaled)
        }
    }
    
    func bind(model: NewsModel) {
        titleLabel.text = model.title?.text
        
//        var subtitle = model.place ?? ""
//        subtitle.append(" -- \(model.date ?? "")")
//        subtitleLabel.text = subtitle
        
//        if let remoteUrl = model.image {
//            newsImageView.downloaded(from: remoteUrl)
//        }
    }
}
