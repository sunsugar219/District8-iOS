//
//  OverviewViewController.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 29..
//  Copyright (c) 2021. ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class OverviewViewController: BaseViewController {
    
    // MARK: - Public properties -
    
    var presenter: OverviewPresenterInterface!
    
    // MARK: - Private properties -
    
    private var scrollView: UIScrollView!
    private var featured: FeaturedArticle!
    private var tableView: UITableView!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initNavbar()
    }
    
    private func setup() {
        NotificationCenter.default.addObserver(self, selector: #selector(filtersChanged), name: Constants.Notifications.FiltersChanged, object: nil)
        initTableView()
    }
    
    @objc
    private func filtersChanged() {
        presenter.filtersChanged()
    }
    
    private func initNavbar() {
        let infoImage = UIImage(named: "ic_information")!
        let mailImage = UIImage(named: "ic_email")!
        
        let infoButton   = UIBarButtonItem(image: infoImage,  style: .plain, target: self, action: #selector(didTapInfoButton(sender:)))
        let mailButton = UIBarButtonItem(image: mailImage,  style: .plain, target: self, action: #selector(didTapMailButton(sender:)))
        
        navigationItem.leftBarButtonItems = [infoButton, mailButton]
        
        let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(didTapFilterButton(sender:)))
        navigationItem.rightBarButtonItems = [filterButton]
        
        let titleImage = UIImage(named: "img_logo")
        navigationItem.titleView = UIImageView(image: titleImage)
        
    }
    
    @objc
    private func didTapInfoButton(sender: AnyObject){
        
    }
    
    @objc
    private func didTapMailButton(sender: AnyObject){
        
    }
    
    @objc
    private func didTapFilterButton(sender: AnyObject){
        presenter.filterTapped()
    }
    
    private func initTableView() {
        tableView = UITableView()
        tableView.register(FeaturedArticle.self, forCellReuseIdentifier: FeaturedArticle.cellId)
        tableView.register(NewsListItem.self, forCellReuseIdentifier: NewsListItem.cellId)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.bottom.centerX.equalToSuperview()
            make.top.equalTo(view.snp.top)
        }
    }
}

// MARK: - Extensions -

extension OverviewViewController: OverviewViewInterface {
    func reload() {
        tableView.reloadData()
    }
    
}

extension OverviewViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return presenter.getNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FeaturedArticle.cellId, for: indexPath) as! FeaturedArticle
            if let model = presenter.getFeaturedArticle() {
                cell.bind(model: model)
            }
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsListItem.cellId, for: indexPath) as! NewsListItem
            cell.bind(model: presenter.getItem(at: indexPath))
            cell.selectionStyle = .none

            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return (UIScreen.main.bounds.width)*2/3
        } else {
            return 91
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
    
}
