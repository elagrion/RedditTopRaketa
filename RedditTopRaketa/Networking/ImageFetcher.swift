//
//  ImageFetcher.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation
import Combine
import UIKit

protocol ImageFetching {
    var imagePublisher: AnyPublisher<UIImage?, Never> { get }
    var statePublisher: AnyPublisher<ServicingState, Never> { get }
    
    func fetchImage(url: URL)
    func cancel()
}

class ImageFetcher: ImageFetching, ObservableObject {
    
    @Published private(set) var image: UIImage?
    @Published private(set) var state = ServicingState.none
    var imagePublisher: AnyPublisher<UIImage?, Never> { $image.eraseToAnyPublisher() }
    var statePublisher: AnyPublisher<ServicingState, Never> { $state.eraseToAnyPublisher() }
    
    private var cancellable: AnyCancellable?
        
    func fetchImage(url: URL) {
        state = .fetching
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink(receiveCompletion: {[weak self] (result) in
                switch result {
                case .failure(let error):
                    print("ImageFetcher loading \(url) \n error: \(error)")
                    self?.state = .error
                case .finished:
                    break
                }
            }, receiveValue: {[weak self] (value) in
                self?.image = value
            })
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
}
