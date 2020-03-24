//
//  ListingDTO.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation

typealias ListingId = String

struct ListingDTO: Codable {
    let data: ListingDTOData
}

struct ListingDTOData: Codable {
    let children: [PostDTO]
    
    let after: ListingId?
    let before: ListingId?
}

extension ListingDTO {
    static func empty() -> ListingDTO {
        ListingDTO(data: ListingDTOData(children: [], after: nil, before: nil))
    }
}
