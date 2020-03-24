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

class ImageFetcher: ObservableObject {
    
    @Published var image: UIImage?
    private let url: URL
    
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    func fetchImage() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
}
