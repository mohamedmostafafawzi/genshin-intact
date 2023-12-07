//
//  CharacterDetailsRootView.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/19/23.
//

import UIKit

class CharacterDetailsRootView: NiblessView {
    
    // MARK: - Views
    
    
    // MARK: - Initializer
    init() {
        super.init(frame: .zero)
    }
    
    // MARK: - Methods
    override func viewHierarchyDidConfigure() {
        backgroundColor = .background
    }
}

// MARK: - Layout
extension CharacterDetailsRootView {
    override func configureViewHierarchy() {
        
    }
}
