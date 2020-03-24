//
//  BlockingSpinnerView.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation
import SwiftUI

struct BlockingSpinnerView: View {
    
    private enum Consts {
        static let blur = 0.3
    }
    
    var body: some View {
        ActivityIndicator(isAnimating: .constant(true), style: .large)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.gray.opacity(Consts.blur))
            .edgesIgnoringSafeArea(.all)
    }

}
