//
//  RestClient+NewsService.swift
//  District8
//
//  Created by Hodi Zsuzsa on 2021. 07. 30..
//

import Foundation
protocol NewsService {
    func getNews(completion:@escaping NewsLoaded)
}

extension RestClient: NewsService {
    func getNews(completion: @escaping NewsLoaded) {
        request(url: nil) { (result: Result<[NewsModel], Error>) in
            completion(result)
        }
    }
    
}
