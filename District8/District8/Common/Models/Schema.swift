//
//  Schema.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 30..
//

import Foundation
import ObjectMapper

class Schema: Mappable {
    var graph: [GraphItem]?
    var singleItem: GraphItem?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        if let _ = try? map.value("@graph") as [NSDictionary] {
               graph <- map["@graph"]
            } else {
               singleItem <- map["@graph"]
            }
    }
    
}
