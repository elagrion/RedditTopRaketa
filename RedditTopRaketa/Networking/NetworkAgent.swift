//
//  NetworkAgent.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 23.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation
import Combine

protocol NetworkAgenting {
    func run<T: Decodable>(_ api: NetworkAPI) -> AnyPublisher<NetworkResponse<T>, Error>
}

struct NetworkResponse<T> {
    let value: T
    let response: URLResponse
}

struct NetworkAgent: NetworkAgenting {
    func run<T: Decodable>(_ api: NetworkAPI) -> AnyPublisher<NetworkResponse<T>, Error> {
        let request = api.request
        let task =  URLSession.shared.dataTaskPublisher(for: request)
        return task
            .tryMap { result -> NetworkResponse<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return NetworkResponse(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
