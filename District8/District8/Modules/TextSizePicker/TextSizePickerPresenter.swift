//
//  TextSizePickerPresenter.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 31..
//  Copyright (c) 2021. ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class TextSizePickerPresenter {

    // MARK: - Private properties -

    private unowned let view: TextSizePickerViewInterface
    private let interactor: TextSizePickerInteractorInterface
    private let wireframe: TextSizePickerWireframeInterface
    
    private let options = ["Small".localized, "Normal".localized, "Big".localized, "Bigger".localized ]

    // MARK: - Lifecycle -

    init(view: TextSizePickerViewInterface, interactor: TextSizePickerInteractorInterface, wireframe: TextSizePickerWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension TextSizePickerPresenter: TextSizePickerPresenterInterface {
    func getOption(at indexPath: IndexPath) -> String {
        options[indexPath.row]
    }
    
}
