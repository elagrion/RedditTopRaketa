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

    @ObservedObject private var loader: ImageFetcher
    
    init(url: URL) {
        loader = ImageFetcher(url: url)
    }

    var body: some View {
        image
            .onAppear(perform: loader.fetchImage)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image(systemName: "photo")
            }
        }
    }
}
