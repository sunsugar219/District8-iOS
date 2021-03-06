//
//  OverviewInterfaces.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 29..
//  Copyright (c) 2021. ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol OverviewWireframeInterface: WireframeInterface {
    func openDetails(model: NewsModel)
    func openFilter()
}

protocol OverviewViewInterface: ViewInterface {
    func reload()
}

protocol OverviewPresenterInterface: PresenterInterface {
    func getFeaturedArticle() -> NewsModel?
    func getNumberOfItems() -> Int
    func getItem(at indexPath: IndexPath) -> NewsModel
    func didSelectRow(at indexPath: IndexPath)
    
    func filterTapped()
    func filtersChanged()
}

protocol OverviewInteractorInterface: InteractorInterface {
    func getNews(completion: @escaping NewsLoaded)
}
