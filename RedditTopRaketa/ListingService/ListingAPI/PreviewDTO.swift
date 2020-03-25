//
//  PreviewDTO.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation

struct PreviewDTO: Decodable {
    let images: [PreviewImageDTO]?
}

struct PreviewImageDTO: Decodable {
    let sourceURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case source
    }
    
    enum SourceCodingKeys: String, CodingKey {
        case url
    }

    init(from decoder: Decoder) throws {
        guard let container = try? decoder.container(keyedBy: CodingKeys.self),
            let sourceContainer = try? container.nestedContainer(keyedBy: SourceCodingKeys.self, forKey: .source) else {
            self.sourceURL = nil
            return
        }
        self.sourceURL = try? sourceContainer.decode(URL.self, forKey: .url)
    }
    
}
