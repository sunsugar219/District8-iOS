//
//  NewsModel.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 30..
//

import Foundation
import ObjectMapper

class NewsModel: Mappable {
    var title: Title?
    var rawDate: Date?
    var date: String?
    var content: Content?
    var main: YoastHead?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        main <- map["yoast_head_json"]
        content <- map["content"]
        title <- map["title"]
        rawDate <- (map["date"], DateTransform(unit: .seconds))
        getDateString(date: rawDate ?? Date())
    }
    
    private func getDateString(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US")
        self.date = formatter.string(from: Date())
    }
    
}

