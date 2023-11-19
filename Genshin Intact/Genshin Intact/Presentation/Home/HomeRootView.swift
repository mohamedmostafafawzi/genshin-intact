//
//  HomeRootView.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/19/23.
//

import UIKit

class HomeRootView: NiblessView {
    
    // MARK: - Views
    private let logoImageView = UIImageView().style(tintColor: .homeTopIcon,
                                                    image: UIImage(named: "app-logo"),
                                                    contentMode: .scaleAspectFit)
    
    // MARK: - Methods
    override func viewHierarchyDidConfigure() {
        backgroundColor = .background
    }
}

// MARK: - Layout
extension HomeRootView {
    override func configureViewHierarchy() {
        add(logoImageView, then: {
            $0.anchor(.top(topAnchor, constant: 8))
            $0.constrainHeight($0.widthAnchor)
            $0.constrainWidth(150)
            $0.centerXToSuperview()
        })
        
    }
}
