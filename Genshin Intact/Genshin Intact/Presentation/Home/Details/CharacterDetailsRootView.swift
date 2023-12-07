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
    private let elementImageView = UIImageView().style(image: UIImage(named: "image-placeholder"),
                                                       contentMode: .scaleAspectFill,
                                                       cornerRadius: 15)
    // MARK: - Initializer
    init(character: Character) {
        super.init(frame: .zero)
        
        let imageURL = ImageAsset(character: character, assetType: .card).imageURL
        characterImageView.setImage(url: imageURL,
                                    placeholder: UIImage(named: "image-placeholder"))
        if !character.description.isEmpty {
            descriptionLabel.text = character.description
        } else {
            descriptionLabel.text = "Unfortunately, we don't know any thing about this character. How mysterious!"
        }
        
        switch character.vision {
        case .anemo:
            elementImageView.image = UIImage(named: "element-anemo")
        case .cryo:
            elementImageView.image = UIImage(named: "element-cryo")
        case .dendro:
            elementImageView.image = UIImage(named: "element-dendro")
        case .electro:
            elementImageView.image = UIImage(named: "element-electro")
        case .geo:
            elementImageView.image = UIImage(named: "element-geo")
        case .hydro:
            elementImageView.image = UIImage(named: "element-hydro")
        case .pyro:
            elementImageView.image = UIImage(named: "element-pyro")
        }
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
        let descriptionVisualEffectView = UIVisualEffectView(effect: blurEffect)
        descriptionVisualEffectView.layer.cornerRadius = Dimensions.mediumCornerRadius
        descriptionVisualEffectView.clipsToBounds = true
        
        add(descriptionVisualEffectView, then: {
            $0.anchor(.bottom(safeAreaLayoutGuide.bottomAnchor, constant: 20))
            $0.constrainWidth(safeAreaLayoutGuide.widthAnchor,
                              multiplier: 0.9,
                              priority: .defaultHigh)
            $0.centerXTo(self.centerXAnchor)
        })
        
        add(descriptionLabel, then: {
            $0.anchor(.leading(descriptionVisualEffectView.leadingAnchor, constant: 20),
                      .top(descriptionVisualEffectView.topAnchor, constant: 20),
                      .trailing(descriptionVisualEffectView.trailingAnchor, constant: 20),
                      .bottom(descriptionVisualEffectView.bottomAnchor, constant: 20))
        })
        
        let infoVisualEffectView = UIVisualEffectView(effect: blurEffect)
        infoVisualEffectView.layer.cornerRadius = Dimensions.mediumCornerRadius
        infoVisualEffectView.clipsToBounds = true
        
        add(infoVisualEffectView, then: {
            $0.anchor(.leading(safeAreaLayoutGuide.leadingAnchor, constant: 20),
                      .top(safeAreaLayoutGuide.topAnchor, constant: 20))
            $0.constrainWidth(50)
        })
        
        // Configure element image
        add(elementImageView, then: {
            $0.anchor(.top(infoVisualEffectView.topAnchor, constant: 8),
                      .bottom(infoVisualEffectView.bottomAnchor, constant: 8))
            $0.centerXTo(infoVisualEffectView.centerXAnchor)
            $0.constrainHeight(30)
            $0.constrainWidth($0.heightAnchor)
            
        })
    }
}
