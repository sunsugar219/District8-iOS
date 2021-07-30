//
//  DetailViewController.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 29..
//  Copyright (c) 2021. ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import WebKit

final class DetailViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: DetailPresenterInterface!
    
    private var scrollView: UIScrollView!
    private var webView = WKWebView(frame: .zero)

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        scrollView = UIScrollView()
//        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.showsVerticalScrollIndicator = true
//        view.addSubview(scrollView)
//
//        scrollView.snp.makeConstraints { make in
//            make.top.equalTo(view.snp.top)
//            make.leading.trailing.bottom.equalToSuperview()
//        }
        
        webView.contentMode = .scaleAspectFit
        webView.sizeToFit()
        webView.autoresizesSubviews = true
        webView.isOpaque = false
        webView.scrollView.backgroundColor = .clear
        webView.scrollView.isScrollEnabled = true
        webView.backgroundColor = .clear
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.view.setNeedsLayout()
        webView.navigationDelegate = self
        if let content =  presenter.getContent() {
        webView.loadHTMLString(content, baseURL: nil)
        }    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let content =  presenter.getContent() {
        webView.loadHTMLString(content, baseURL: nil)
        }
    }

}

// MARK: - Extensions -

extension DetailViewController: DetailViewInterface {
}
extension DetailViewController: WKUIDelegate, WKNavigationDelegate {
    
}
