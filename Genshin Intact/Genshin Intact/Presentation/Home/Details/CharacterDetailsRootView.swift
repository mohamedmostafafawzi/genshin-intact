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
    private let descriptionLabel = UILabel().style(font: .regular(size: .bodyM),
                                                            textColor: .headerText,
                                                            textAlignment: .center,
                                                            numberOfLines: 0)
    // MARK: - Initializer
    init(character: Character) {
        super.init(frame: .zero)
        
        let imageURL = ImageAsset(character: character, assetType: .card).imageURL
        characterImageView.setImage(url: imageURL,
                                    placeholder: UIImage(named: "image-placeholder"))
        
        descriptionLabel.text = character.description
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
        
        let blurEffect = UIBlurEffect(style: .systemMaterial)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.layer.cornerRadius = Dimensions.mediumCornerRadius
        visualEffectView.clipsToBounds = true
        
        add(visualEffectView, then: {
            $0.anchor(.bottom(safeAreaLayoutGuide.bottomAnchor, constant: 20))
            $0.constrainWidth(safeAreaLayoutGuide.widthAnchor,
                              multiplier: 0.9,
                              priority: .defaultHigh)
            $0.centerXTo(self.centerXAnchor)
        })
        
        add(descriptionLabel, then: {
            $0.anchor(.leading(visualEffectView.leadingAnchor, constant: 20),
                      .top(visualEffectView.topAnchor, constant: 20),
                      .trailing(visualEffectView.trailingAnchor, constant: 20),
                      .bottom(visualEffectView.bottomAnchor, constant: 20))
        })
    }
}
