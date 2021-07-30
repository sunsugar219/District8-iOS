//
//  Title.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 30..
//

import Foundation
import ObjectMapper

class Title: Mappable {
    var text: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        text <- map["rendered"]
    }
    
}
