//
//  CharactersCollectionViewCell.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 12/5/23.
//

import UIKit

/// Represent a character
class CharactersCollectionViewCell: NiblessCollectionViewCell {
    
    // MARK: - Views
    private let characterImageBackgroundView = UIView().style(cornerRadius: Dimensions.cornerRadius)
    private let characterImageView = UIImageView().style(contentMode: .scaleAspectFill,
                                                         cornerRadius: Dimensions.cornerRadius)
    private let titleLabel = UILabel().style(font: .regular(size: .bodyM),
                                             textColor: .headerLightContentText,
                                             textAlignment: .center,
                                             numberOfLines: 1)
    private let elementImageView = UIImageView().style(image: UIImage(named: "image-placeholder"),
                                                       contentMode: .scaleAspectFill,
                                                       cornerRadius: 15)
    
    private let fiveStarsGradientView = GradientView(color: .fiveStars, direction: .bottom)
    private let fourStarsGradientView = GradientView(color: .fourStars, direction: .bottom)
    
    // MARK: - Methods
    func configure(with viewModel: CharactersCollectionViewCellViewModel) {
        characterImageView.setImage(url: viewModel.imageURL)
        titleLabel.text = viewModel.title
        
        switch viewModel.rarity {
        case .fourStar:
            characterImageBackgroundView.backgroundColor = .fourStars
            fourStarsGradientView.isHidden = false
            fiveStarsGradientView.isHidden = true
        case .fiveStar:
            characterImageBackgroundView.backgroundColor = .fiveStars
            fourStarsGradientView.isHidden = true
            fiveStarsGradientView.isHidden = false
        }
        
        elementImageView.isHidden = false
        switch viewModel.element {
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
        case .none:
            elementImageView.isHidden = true
        }
    }
}

// MARK: - Layout
extension CharactersCollectionViewCell {
    override func configureViewHierarchy() {
        // Configure character image background view
        contentView.add(characterImageBackgroundView, then: {
            $0.anchor(.leading(contentView.leadingAnchor),
                      .top(contentView.topAnchor),
                      .trailing(contentView.trailingAnchor),
                      .bottom(contentView.bottomAnchor))
        })
        
        // Configure character image
        contentView.add(characterImageView, then: {
            $0.anchor(.top(contentView.topAnchor),
                      .leading(contentView.leadingAnchor),
                      .trailing(contentView.trailingAnchor),
                      .bottom(contentView.bottomAnchor))
        })
        
        
        // Configure gradient view
        contentView.add(fourStarsGradientView, then: {
            $0.anchor(.leading(contentView.leadingAnchor),
                      .trailing(contentView.trailingAnchor),
                      .bottom(contentView.bottomAnchor))
            $0.constrainHeight(characterImageBackgroundView.heightAnchor, multiplier: 0.3)
        })
        
        contentView.add(fiveStarsGradientView, then: {
            $0.anchor(.leading(contentView.leadingAnchor),
                      .trailing(contentView.trailingAnchor),
                      .bottom(contentView.bottomAnchor))
            $0.constrainHeight(characterImageBackgroundView.heightAnchor, multiplier: 0.3)
        })
        
        // Configure character name
        contentView.add(titleLabel, then: {
            $0.anchor(.bottomGreaterThanOrEqualTo(characterImageBackgroundView.bottomAnchor, constant: 8),
                      .leading(characterImageBackgroundView.leadingAnchor),
                      .trailing(characterImageBackgroundView.trailingAnchor))
        })
        
        // Configure element image
        if !elementImageView.isHidden {
            let blurEffect = UIBlurEffect(style: .systemMaterial)
            let infoVisualEffectView = UIVisualEffectView(effect: blurEffect)
            infoVisualEffectView.layer.cornerRadius = 10
            infoVisualEffectView.clipsToBounds = true
            
            add(infoVisualEffectView, then: {
                $0.centerYTo(characterImageBackgroundView.topAnchor, constant: 15)
                $0.centerXTo(characterImageBackgroundView.leadingAnchor, constant: 15)
                $0.constrainHeight(20)
                $0.constrainWidth($0.heightAnchor)
            })
        }
        add(elementImageView, then: {
            $0.centerYTo(characterImageBackgroundView.topAnchor, constant: 15)
            $0.centerXTo(characterImageBackgroundView.leadingAnchor, constant: 15)
            $0.constrainHeight(20)
            $0.constrainWidth($0.heightAnchor)
        })
    }
}
