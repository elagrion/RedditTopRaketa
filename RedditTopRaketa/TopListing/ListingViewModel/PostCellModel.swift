//
//  PostCellModel.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation
import Combine
import UIKit

struct PostCellModel: Identifiable {
    
    let id: String
    let title: String
    let author: String
    let created: String
    let imageUrl: URL?
        
    init(dto: PostDTOData) {
        self.id = dto.id
        self.title = dto.title
        self.author = dto.author
        self.created = dto.created.sinceString()
        self.imageUrl = dto.thumbnail
    }
    
//    func fetchImage() {
//        ImageFetcher().fetchImage(imageUrl)
//            .store(in: &disposeBag)
//    }
//
//    func cancel() {
//        disposeBag = Set()
//    }
}

//extension PostCellModel: Hashable {
//    static func == (lhs: PostCellModel, rhs: PostCellModel) -> Bool {
//        lhs.id == rhs.id
//    }
//
//}
