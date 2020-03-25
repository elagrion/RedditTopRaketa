//
//  PostDTO.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation

struct PostDTO: Decodable {
    let data: PostDTOData
}

struct PostDTOData: Decodable {
    let title: String
    let author: String
    let created: Date
    
    let name: ListingId
    
    let thumbnail: URL?
    
    let preview: PreviewDTO?
}

extension PostDTOData: Identifiable {
    var id: String {
        return name
    }
}
