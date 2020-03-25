//
//  URLImageView.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation
import SwiftUI

struct URLImageView : View {

    @ObservedObject private var loader = ImageFetcher()
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }

    var body: some View {
        image
            .onAppear(perform: { self.loader.fetchImage(url: self.url) })
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if loader.state == .error {
                Image(systemName: "xmark.octagon")
            } else {
                Image(systemName: "photo")
            }
        }
    }
}
