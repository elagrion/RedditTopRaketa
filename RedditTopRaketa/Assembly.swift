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
        RedditTopView(viewModel: TopListingViewModel(fetcher: TopListingFetcher(network: networkAgent)))
    }
    
    func detailView(post: PostCellModel) -> DetailView {
        DetailView(viewModel: DetailViewModel(mediaURL: post.previewUrl,
                                              author: post.author,
                                              imagerFetcher: ImageFetcher()))
    }    
}
