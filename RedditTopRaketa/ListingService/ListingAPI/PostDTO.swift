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
    let numComments: Int
    
    let preview: PreviewDTO?
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case created
        case name
        case thumbnail
        case numComments = "num_comments"
        case preview
    }

}

extension PostDTOData: Identifiable {
    var id: String {
        return name
    }
}
