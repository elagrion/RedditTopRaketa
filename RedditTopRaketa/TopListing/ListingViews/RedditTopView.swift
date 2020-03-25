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
            ZStack {
                List {
                    if (viewModel.state == .error) {
                        errorCell
                    }
                    cellList
                    loadNextButton
                }
                if (viewModel.state == .fetching) {
                    BlockingSpinnerView()
                }
            }
            .navigationBarTitle("Top of the  Reddit")
            .navigationBarItems(trailing: refreshButton)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: viewModel.onAppear)
        
    }
    
    private var cellList: some View {
        ForEach(viewModel.posts, id: \.id) { post in
            self.cell(for: post)
        }
    }
    
    private func cell(for post: PostCellModel) -> AnyView {
        if post.previewAvailible {
            return AnyView(NavigationLink(destination: Assembly.shared.detailView(post: post)) {
                RedditPostCell(model: post)
            })
        } else {
            return AnyView(RedditPostCell(model: post))
        }
    }
    
    private var refreshButton: some View {
        Button(action: viewModel.onRefresh) {
            HStack {
                Text("Refresh")
                    .fontWeight(.bold)
            }
        }
    }
    
    private var loadNextButton: some View {
        Button(action: viewModel.onFetchNextListing) {
            HStack {
                Text("Load next posts")
                Image(systemName: "forward")
            }
        }
    }
        
    private var errorCell: some View {
        Text("Something went wrong, try to refresh")
            .foregroundColor(Color.red)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RedditTopView(viewModel: TopListingViewModel(fetcher: TopListingFetcher(network: NetworkAgent())))
    }
}
