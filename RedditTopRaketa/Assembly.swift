//
//  Assembly.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation

class Assembly {
    
    static let shared = Assembly()
    
    let networkAgent = NetworkAgent()
    
    func redditTopView() -> RedditTopView {
        RedditTopView(viewModel: TopListingViewModel(fetching: TopListingFetch(network: networkAgent)))
    }
    
    
}
