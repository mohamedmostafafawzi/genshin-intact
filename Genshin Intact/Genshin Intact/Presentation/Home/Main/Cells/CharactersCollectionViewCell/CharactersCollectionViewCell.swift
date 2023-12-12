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
    private let characterImageView = UIImageView().style(image: UIImage(named: "image-placeholder"),
                                                         contentMode: .scaleAspectFill,
                                                         cornerRadius: Dimensions.cornerRadius)
    private let titleLabel = UILabel().style(font: .bold(size: .bodyL),
                                                     textColor: .headerText,
                                                     textAlignment: .center,
                                                     numberOfLines: 1)
    private let subtitleLabel = UILabel().style(font: .regular(size: .bodyM),
                                                            textColor: .headerText,
                                                            textAlignment: .center,
                                                            numberOfLines: 1)
    private let elementImageView = UIImageView().style(image: UIImage(named: "image-placeholder"),
                                                       contentMode: .scaleAspectFill,
                                                       cornerRadius: 15)
    
    // MARK: - Methods
    func configure(with viewModel: CharactersCollectionViewCellViewModel) {
        characterImageView.setImage(
            url: viewModel.imageURL,
            placeholder: UIImage(named: "image-placeholder")
        )
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        
        viewModel.rarity == .fourStar ?
        (characterImageBackgroundView.backgroundColor = .fourStars):
        (characterImageBackgroundView.backgroundColor = .fiveStars)
        
        switch viewModel.vision {
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
}

// MARK: - Layout
extension CharactersCollectionViewCell {
    override func configureViewHierarchy() {
        // Configure character image background view
        contentView.add(characterImageBackgroundView, then: {
            $0.anchor(.leading(contentView.leadingAnchor),
                      .top(contentView.topAnchor),
                      .trailing(contentView.trailingAnchor))
            
            $0.constrainHeight($0.widthAnchor)
        })
        
        // Configure character image
        contentView.add(characterImageView, then: {
            $0.anchor(.leading(contentView.leadingAnchor),
                      .top(contentView.topAnchor),
                      .trailing(contentView.trailingAnchor))
            
            $0.constrainHeight($0.widthAnchor)
        })
        
        // Configure character name
        contentView.add(titleLabel, then: {
            $0.anchor(.leading(contentView.leadingAnchor, constant: 8),
                      .top(characterImageView.bottomAnchor, constant: 8),
                      .trailing(contentView.trailingAnchor, constant: 8))
        })
        
        // Configure character description
        contentView.add(subtitleLabel, then: {
            $0.anchor(.top(titleLabel.bottomAnchor, constant: 4),
                      .bottomGreaterThanOrEqualTo(contentView.bottomAnchor, constant: 8),
                      .leading(characterImageView.leadingAnchor),
                      .trailing(characterImageView.trailingAnchor))
            $0.centerXTo(titleLabel.centerXAnchor)
        })
        
        let blurEffect = UIBlurEffect(style: .systemMaterial)
        let infoVisualEffectView = UIVisualEffectView(effect: blurEffect)
        infoVisualEffectView.layer.cornerRadius = 10
        infoVisualEffectView.clipsToBounds = true
        
        add(infoVisualEffectView, then: {
            $0.centerYTo(characterImageView.topAnchor, constant: 15)
            $0.centerXTo(characterImageView.leadingAnchor, constant: 15)
            $0.constrainHeight(20)
            $0.constrainWidth($0.heightAnchor)
        })
        
        // Configure element image
        add(elementImageView, then: {
            $0.centerYTo(characterImageView.topAnchor, constant: 15)
            $0.centerXTo(characterImageView.leadingAnchor, constant: 15)
            $0.constrainHeight(20)
            $0.constrainWidth($0.heightAnchor)
        })
    }
}
