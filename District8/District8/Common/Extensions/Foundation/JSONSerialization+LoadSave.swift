//
//  JSONSerialization+LoadSave.swift
//  YourStylist
//
//  Created by Hodi Zsuzsa on 2021. 04. 03..
//  Copyright © 2021. Sunsugar Media. All rights reserved.
//

import Foundation

/**
 Extension to save/load a JSON object by filename. (".json" extension is assumed and automatically added.)
 */
extension JSONSerialization {
    
    static func loadJSON(withFilename filename: String) throws -> Any? {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent(filename)
            fileURL = fileURL.appendingPathExtension("json")
            let data = try Data(contentsOf: fileURL)
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .mutableLeaves])
            return jsonObject
        }
        return nil
    }
    
    static func save(jsonObject: Any, toFilename filename: String) throws -> Bool{
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent(filename)
            fileURL = fileURL.appendingPathExtension("json")
            if fm.fileExists(atPath: fileURL.absoluteString) {
                do {
                    try fm.removeItem(at: fileURL)
                } catch let error {
                    print("error while removing previous version: \n \(error)")
                }
            }
            let data = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
            try data.write(to: fileURL, options: [.atomic])
            return true
        }
        
        return false
    }
    
//    static func parseJson(anyObj:AnyObject) -> Array<LocalClothe> {
//        
//        var list:Array<LocalClothe> = []
//        
//        if  anyObj is Array<AnyObject> {
//            
//            
//            for json in anyObj as! Array<AnyObject> {
//                let clothe:LocalClothe = LocalClothe()
//                
//                if let name = json["name"] as AnyObject? as? String {
//                    clothe.name = name
//                } else if let name = json["description"] as AnyObject? as? String {
//                    clothe.name = name
//                }
//                if let local = json["localImageUrl"]  as AnyObject? as? String {
//                    clothe.localImageUrl = local
//                } else if let buyUrl = json["url"]  as AnyObject? as? String, let remote = json["image_url"]  as AnyObject? as? String {
//                    clothe.buyUrl = buyUrl
//                    clothe.remoteImageUrl = remote
//                }
//                
//                clothe.occasion  =  (json["occasion"]  as AnyObject? as? String) ?? ""
//                clothe.weather  =  (json["weather"]  as AnyObject? as? [String]) ?? []
//                list.append(clothe)
//            }
//            
//        }
//        
//        return list
//        
//    }
 
}
