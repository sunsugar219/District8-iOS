//
//  APIError.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 30..
//

import Foundation
class APIError: Codable, LocalizedError {
    var name: String = ""
    var message: String? = ""
    var code: Int = 0
    var type: String?
    var data: String?
    
    var errorDescription: String? {
        return message
    }
}
