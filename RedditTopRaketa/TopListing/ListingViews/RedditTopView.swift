//
//  ContentView.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 23.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import SwiftUI

struct RedditTopView: View {
    @ObservedObject private var viewModel: TopListingViewModel

    init(viewModel: TopListingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts, id: \.id) { post in
                    NavigationLink(destination: DetailView()) {
                        RedditPostCell(model: post)
                    }
                }
                Button(action: viewModel.fetchNextListing) {
                    LoadNextButtonContent()
                }
            }
            .navigationBarTitle("Top of the  Reddit")
            .navigationBarItems(trailing: Button(action: viewModel.refresh) {
                RefreshButtonContent()
            })
            
        }.onAppear(perform: viewModel.fetchNextListing)
        
    }
}

struct LoadNextButtonContent: View {
    var body: some View {
        HStack {
            Text("Load next posts")
            Image(systemName: "forward.fill")
        }
        .accentColor(Color.blue)
    }
}

struct RefreshButtonContent: View {
    var body: some View {
        HStack {
            Image(systemName: "gobackward")
            Text("Refresh")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RedditTopView(viewModel: TopListingViewModel(fetching: TopListingFetch(network: NetworkAgent())))
    }
}
