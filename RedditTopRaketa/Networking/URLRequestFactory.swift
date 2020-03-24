//
//  URLRequestFactory.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation

extension URLRequest {
    static func createGET(url: String, query: [String: String]?) -> URLRequest {
        var urlComponents = URLComponents(string: url)
        let queryItems = query?.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        urlComponents?.queryItems = queryItems
        guard let urlToRequest = urlComponents?.url else {
            fatalError("Couldn't create request for \(url)")
        }
        let request = URLRequest(url: urlToRequest)
        return request
    }
}
