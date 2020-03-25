//
//  DetailViewModel.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation
import Combine
import UIKit

class DetailViewModel: ObservableObject {

    @Published private(set) var image: UIImage?
    @Published private(set) var state = ServicingState.none
    @Published private(set) var showSharing = false
    
    let mediaURL: URL?
    let author: String
    let imagerFetcher: ImageFetching
    
    private var disposeBag = Set<AnyCancellable>()
    
    init(mediaURL: URL?,
         author: String,
         imagerFetcher: ImageFetching) {
        self.mediaURL = mediaURL
        self.author = author
        self.imagerFetcher = imagerFetcher
        
        bindOutputs()
    }
    
    private func bindOutputs() {
        imagerFetcher.imagePublisher
            .assign(to: \.image, on: self)
            .store(in: &disposeBag)

        imagerFetcher.statePublisher
            .assign(to: \.state, on: self)
            .store(in: &disposeBag)

    }
    
    func onAppear() {
        guard let url = mediaURL else { return }
        imagerFetcher.fetchImage(url: url)
    }
    
    func onShare() {
        showSharing = true
    }
    
    func onEndShare() {
        showSharing = false
    }
}
