//
//  OverviewPresenter.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 29..
//  Copyright (c) 2021. ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class OverviewPresenter {

    // MARK: - Private properties -

    private unowned let view: OverviewViewInterface
    private let interactor: OverviewInteractorInterface
    private let wireframe: OverviewWireframeInterface
    
    private var featured: NewsModel?
    private var newsList = [NewsModel]()

    // MARK: - Lifecycle -

    init(view: OverviewViewInterface, interactor: OverviewInteractorInterface, wireframe: OverviewWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    func viewDidLoad() {
        interactor.getNews { [weak self] result in
            switch result {
            case .success(let list):
                print(list)
                self?.featured = list[0]
                self?.newsList = list
                self?.newsList.remove(at: 0)
                self?.view.reload()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - Extensions -

extension OverviewPresenter: OverviewPresenterInterface {
    func didSelectRow(at indexPath: IndexPath) {
        if let model = featured, indexPath.section == 0 {
            wireframe.openDetails(model: model)
        } else if indexPath.section == 1 {
            wireframe.openDetails(model: newsList[indexPath.row])

        }
    }
    
    func getFeaturedArticle() -> NewsModel? {
        featured
    }
    
    func getNumberOfItems() -> Int {
        newsList.count
    }
    
    func getItem(at indexPath: IndexPath) -> NewsModel {
        newsList[indexPath.row]
    }
    
}
