//
//  GraphItem.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 30..
//

import Foundation
import ObjectMapper

class GraphItem: Mappable {
    var type: String?
    var id: String?
    
    // type == article
    var headline: String?
    var dateModified: Date?
    var datePublished: Date?
    var image: Image?
    var thumbnailUrl: String?
    //below will contain cities for filter feature
    var articleSection: [String?]?
    
    // type == person
    var name: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        type <- map["@type"]
        id <- map["@id"]
        
        headline <- map["headline"]
        dateModified <- (map["dateModified"], DateTransform(unit: .seconds))
        datePublished <- (map["datePublished"], DateTransform(unit: .seconds))
        image <- map["image"]
        thumbnailUrl <- map["thumbnailUrl"]
        articleSection <- map["articleSection"]
        
        name <- map["name"]
    }
    
}

