//
//  String+Localized.swift
//  WhatShouldIWear
//
//  Created by mac on 2021. 02. 26..
//  Copyright © 2021. Sunsugar Media. All rights reserved.
//

import Foundation

extension String {
    public var localized: String {
        NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    public func localizeWithComment (comment: String) -> String {
    NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)

    }
    
    public func localizeWithFormat(args: CVarArg...) -> String {
        String(format: self.localized, locale: nil, arguments: args)
    }
    
    public func localizeWithFormat(local: NSLocale?, args: CVarArg...) -> String {
        String(format: self.localized, locale: local as Locale?, arguments: args)
    }
}
