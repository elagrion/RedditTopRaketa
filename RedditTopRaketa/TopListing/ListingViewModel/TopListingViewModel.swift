//
//  ListingService.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 23.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation
import Combine

class TopListingViewModel: ObservableObject {
    
    @Published private var listingsSource = [ListingDTO]()
    
    @Published private(set) var posts = [PostCellModel]()
    @Published private(set) var state = ServicingState.none
    
    private let fetching: TopListingFetching
    private var disposeBag = Set<AnyCancellable>()
    
    init(fetching: TopListingFetching) {
        self.fetching = fetching
        bindOutputs()
    }
    
    private func bindOutputs() {
        $listingsSource
            .map { listings -> [PostCellModel] in
                return listings
                    .flatMap { $0.data.children }
                    .map { PostCellModel(dto: $0.data) }
            }
            .assign(to: \.posts, on: self)
            .store(in: &disposeBag)
    }
    
    func refresh() {
        listingsSource = []
        fetchNextListing()
    }

    func fetchNextListing() {
        let after  = listingsSource.last?.data.after
        state = .fetching
        fetching.fetchListing(after: after)
            .sink(receiveCompletion: { [weak self] (completion) in
                guard let self = self else { return }
                switch completion {
                case .failure(let error):
                    self.state = .error(error: error)
                case .finished:
                    self.state = .none
                }
            }, receiveValue: { [weak self] listingDTOs in
                guard let self = self else { return }
                self.state = .none
                self.listingsSource.append(listingDTOs)
            })
            .store(in: &disposeBag)
    }

}
