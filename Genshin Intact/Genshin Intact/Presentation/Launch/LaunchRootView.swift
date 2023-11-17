//
//  LaunchRootView.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import UIKit

class LaunchRootView: NiblessView {
    
    // MARK: - Views
    private let logoImageView = UIImageView().style(tintColor: .launchIcon,
                                                    image: UIImage(named: "app-logo"),
                                                    contentMode: .scaleAspectFit)
    private let activityIndicator = UIActivityIndicatorView().style(color: .activityIndicator,
                                                                    style: .medium)
    
    // MARK: - Methods
    override func viewHierarchyDidConfigure() {
        backgroundColor = .background
        activityIndicator.startAnimating()
    }
}

// MARK: - Layout
extension LaunchRootView {
    override func configureViewHierarchy() {
        add(logoImageView, then: {
            $0.constrainHeight(250)
            $0.constrainWidth(250)
            $0.centerInSuperview()
        })
        
        add(activityIndicator, then: {
            $0.centerXToSuperview()
            $0.anchor(.top(logoImageView.bottomAnchor, constant: 16))
        })
    }
}
