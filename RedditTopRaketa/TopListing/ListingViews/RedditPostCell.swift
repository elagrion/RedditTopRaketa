//
//  RedditTopCell.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation
import SwiftUI

struct RedditPostCell: View {
    
    private enum Consts {
        static let padding: CGFloat = 12.0
        static let imageWidth: CGFloat = 140.0
        static let imageHeight: CGFloat = 90.0
    }
    
    let model: PostCellModel
    
    var body: some View {
        HStack {
            imageView()
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.body)
                Spacer(minLength: Consts.padding)
                HStack {
                    Text(model.author)
                        .font(.footnote)
                    Spacer(minLength: Consts.padding)
                    Text(model.created)
                        .font(.footnote)
                }
            }
        }
    }
    
    func imageView() -> AnyView {
        if let url = model.imageUrl {
            return AnyView(
                URLImageView(url: url)
                    .frame(width: Consts.imageWidth, height: Consts.imageHeight, alignment: .center)
                    .padding(EdgeInsets(top: 0,
                                        leading: Consts.padding,
                                        bottom: 0,
                                        trailing: Consts.padding))
            )
        } else {
            return AnyView(Spacer(minLength: Consts.imageWidth))
        }
    }
    
}
