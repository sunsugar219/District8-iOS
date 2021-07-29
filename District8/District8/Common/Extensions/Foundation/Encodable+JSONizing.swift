//
//  Encodable+JSONizing.swift
//  YourStylist
//
//  Created by Hodi Zsuzsa on 2021. 04. 06..
//  Copyright © 2021. Sunsugar Media. All rights reserved.
//

import Foundation
extension Encodable {
    public var dictionary: [String : Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    public var convertToString: String? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        do {
            let jsonData = try jsonEncoder.encode(self)
            return  String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
}
