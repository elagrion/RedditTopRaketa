//
//  TopListingFetch.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation
import Combine

protocol TopListingFetching {
    func fetchListing(after: ListingId?) -> AnyPublisher<ListingDTO, Error>
}

class TopListingFetcher: TopListingFetching {
    private let network: NetworkAgenting
    
    init(network: NetworkAgenting) {
        self.network = network
    }
    
    func fetchListing(after: ListingId?) -> AnyPublisher<ListingDTO, Error> {
        return network.run(RedditListingAPI.top(after: after))
            .map({ response in
                return response.value
            })
            .eraseToAnyPublisher()
    }
}
