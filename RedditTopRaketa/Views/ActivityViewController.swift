//
//  UIActivityViewControllerWrapper.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 25.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class UIActivityViewControllerHost: UIViewController {
    var image: UIImage?
    var completion: UIActivityViewController.CompletionWithItemsHandler? = nil

    override func viewDidAppear(_ animated: Bool) {
        share()
    }

    func share() {
        guard let image = image else {
            completion?(nil, false, nil, nil)
            return
        }
        let toShare = [ image ]
        let activityViewController = UIActivityViewController(activityItems: toShare, applicationActivities: nil)

        activityViewController.completionWithItemsHandler = completion
        activityViewController.popoverPresentationController?.sourceView = view
        present(activityViewController, animated: true, completion: nil)
    }
}

struct ActivityViewController: UIViewControllerRepresentable {
    var image: UIImage?
    let completion: () -> ()

    func makeUIViewController(context: Context) -> UIActivityViewControllerHost {
        let result = UIActivityViewControllerHost()

        result.completion = { (activityType, completed, returnedItems, error) in
            self.completion()
        }

        return result
    }

    func updateUIViewController(_ uiViewController: UIActivityViewControllerHost, context: Context) {
        uiViewController.image = image
    }

}
