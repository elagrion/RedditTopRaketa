//
//  RedditTopAPI.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 23.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation
import Combine

enum RedditListingAPI {
    static let base = "https://reddit.com/"
    
    case top(after: ListingId?)
}

extension RedditListingAPI: NetworkAPI {
    var url: String {
        switch self {
        case .top:
            return Self.base + "top.json"
        }
    }
    
    var method: NetworkMethod {
        switch self {
        case .top:
            return .get
        }
    }
    
    var queryParams: [String : String]? {
        switch self {
        case .top(let after):
            var dict = ["raw_json": "1"]
            guard let after = after else { return dict }
            dict["after"] = after
            return dict
        }
    }
}
