//
//  DetailView.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailView: View {
    @ObservedObject private var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Group {
            preview()
            if viewModel.showSharing {
                ActivityViewController(image: viewModel.image, completion: viewModel.onEndShare)
            }
        }
        .onAppear(perform: viewModel.onAppear)
        .navigationBarTitle(viewModel.author)
        .navigationBarItems(trailing: saveButton)
    }
    
    private func preview() -> AnyView {
        guard let image = viewModel.image else {
            return AnyView(Text("No preview availible"))
        }
        return AnyView(Image(uiImage: image)
                .aspectRatio(contentMode: .fit))
    }
    
    private var saveButton: some View {
        Button(action: viewModel.onShare) {
            Image(systemName: "square.and.arrow.up")
        }
    }
    
}
