//
//  DetailViewModel.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    let mediaURL: URL?
    let author: String
    
    init(mediaURL: URL?, author: String) {
        self.mediaURL = mediaURL
        self.author = author
        print("\(mediaURL)")
    }
    
    func share() {
        
    }
}
