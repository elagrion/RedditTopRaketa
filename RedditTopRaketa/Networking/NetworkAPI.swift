//
//  EndpointFacade.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 23.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation

enum NetworkMethod: String {
    case get = "GET"
//    case post = "POST" – Not supported yet
}

protocol NetworkAPI {
    var url: String { get }
    var queryParams: [String: String]? { get }
    var method: NetworkMethod { get }
    var request: URLRequest { get }
}

extension NetworkAPI {
    var queryParams: [String: String]? { return nil }
    
    var request : URLRequest {
        switch method {
        case .get:
            return URLRequest.createGET(url: url, query: queryParams)
        }
    }
}
