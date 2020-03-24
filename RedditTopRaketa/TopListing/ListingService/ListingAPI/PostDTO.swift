//
//  PostDTO.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation

struct PostDTO: Codable {
    let data: PostDTOData
}

struct PostDTOData: Codable {
    let title: String
    let author: String
    let created: Date
    
    let name: ListingId
    
    let thumbnail_height: Int?
    let thumbnail_width: Int?
    let thumbnail: URL?
}

extension PostDTOData: Identifiable {
    var id: String {
        return name
    }
}
