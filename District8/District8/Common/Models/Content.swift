//
//  Content.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 30..
//

import Foundation
import ObjectMapper

class Content: Mappable {
    var text: String?
    var protected: Bool?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        text <- map["rendered"]
        protected <- map["protected"]
    }
    
}
