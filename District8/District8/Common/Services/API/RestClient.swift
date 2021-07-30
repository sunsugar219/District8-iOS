//
//  RestClient.swift
//  WhatShouldIWear
//
//  Created by mac on 2021. 03. 19..
//  Copyright © 2021. Sunsugar Media. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Foundation
import ObjectMapper

typealias NewsLoaded = (Result<[NewsModel], Error>) -> Void

final class RestClient: NSObject {
    static let shared = RestClient()
    private override init() {
//        log.info("")
    }
    
    let baseUrl: URL = URL(string: "https://district8.net/wp-json/wp/v2/posts")!
    internal var headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    internal func request<T: Mappable>(url: String?,
                                       method: HTTPMethod = .get,
                                       data: [String: Any]? = nil,
                                       completion: ((Result<T, Error>) -> Void)?) {
        var requestURL = baseUrl
        if let safeurl = url {
            requestURL = URL(string: safeurl)!
        }

        AF.request(requestURL,
                   method: method,
                   parameters: data,
                   encoding: JSONEncoding.default,
                   headers: self.headers)
            .validate(statusCode: 200..<300)
            .responseObject { (response: DataResponse<T,AFError>) in
                print(response.debugDescription)
                switch response.result {
                case .success(let object):
                    if let data = response.data, let error = try? JSONDecoder().decode(APIError.self, from: data) {
                        completion?(Result.failure(error))
                    } else {
                        completion?(Result.success(object))
                    }
                case .failure(let error):
                    if let data = response.data, let apierror = try? JSONDecoder().decode(APIError.self, from: data) {
                        completion?(Result.failure(apierror))
                    } else {
                        completion?(Result.failure(error))
                    }
                }
            }
    }
    
    internal func request<T: Mappable>(url: String?,
                                       method: HTTPMethod = .get,
                                       data: [String: Any]? = nil,
                                       completion: ((Result<[T], Error>) -> Void)?) {
        var requestURL = baseUrl
        if let safeurl = url {
            requestURL = URL(string: safeurl)!
        }

        AF.request(requestURL,
                   method: method,
                   parameters: data,
                   encoding: JSONEncoding.default,
                   headers: self.headers)
            .validate(statusCode: 200..<300)
            .responseArray { (response: DataResponse<[T],AFError>) in
                print(response.debugDescription)
                switch response.result {
                case .success(let object):
                    if let data = response.data, let error = try? JSONDecoder().decode(APIError.self, from: data) {
                        completion?(Result.failure(error))
                    } else {
                        completion?(Result.success(object))
                    }
                case .failure(let error):
                    if let data = response.data, let apierror = try? JSONDecoder().decode(APIError.self, from: data) {
                        completion?(Result.failure(apierror))
                    } else {
                        completion?(Result.failure(error))
                    }
                }
            }
    }
}
