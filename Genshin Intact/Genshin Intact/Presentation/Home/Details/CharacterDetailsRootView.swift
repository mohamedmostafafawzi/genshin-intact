//
//  CharacterDetailsRootView.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/19/23.
//

import UIKit

class CharacterDetailsRootView: NiblessView {
    
    // MARK: - Views
    private let characterImageView = UIImageView().style(contentMode: .scaleAspectFill)
    
    // MARK: - Initializer
    init(character: Character) {
        super.init(frame: .zero)
        
        let imageURL = ImageAsset(character: character, assetType: .card).imageURL
        characterImageView.setImage(url: imageURL,
                                    placeholder: UIImage(named: "image-placeholder"))
    }
    
    // MARK: - Methods
    override func viewHierarchyDidConfigure() {
        backgroundColor = .background
    }
}

// MARK: - Layout
extension CharacterDetailsRootView {
    override func configureViewHierarchy() {
        // Configure character image
        add(characterImageView, then: {
            $0.anchor(.leading(self.leadingAnchor),
                      .top(self.topAnchor),
                      .trailing(self.trailingAnchor),
                      .bottom(self.bottomAnchor))
        })
    }
}
