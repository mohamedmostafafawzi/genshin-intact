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
    private let characterImageView = UIImageView().style(image: UIImage(named: "image-placeholder"),
                                                     contentMode: .scaleAspectFill,
                                                     cornerRadius: Dimensions.cornerRadius)
    private let characterNameLabel = UILabel().style(font: .bold(size: .bodyL),
                                                  textColor: .headerText,
                                                  textAlignment: .center,
                                                  numberOfLines: 1)
    private let characterDescriptionLabel = UILabel().style(font: .regular(size: .bodyM),
                                            textColor: .headerText,
                                            textAlignment: .center,
                                            numberOfLines: 1)
    
    // MARK: - Methods
    func configure(with viewModel: CharactersCollectionViewCellViewModel) {
        characterImageView.setImage(
            url: viewModel.imageURL,
            placeholder: UIImage(named: "image-placeholder")
        )
        characterNameLabel.text = viewModel.characterName
        characterDescriptionLabel.text = viewModel.characterDescription
    }
}

// MARK: - Layout
extension CharactersCollectionViewCell {
    override func configureViewHierarchy() {
        // Configure character image
        contentView.add(characterImageView, then: {
            $0.anchor(.leading(contentView.leadingAnchor),
                      .top(contentView.topAnchor),
                      .trailing(contentView.trailingAnchor))
            
            $0.constrainHeight($0.widthAnchor)
        })
        
        // Configure character name
        contentView.add(characterNameLabel, then: {
            $0.anchor(.leading(contentView.leadingAnchor, constant: 8),
                      .top(characterImageView.bottomAnchor, constant: 8),
                      .trailing(contentView.trailingAnchor, constant: 8))
        })
        
        // Configure character description
        contentView.add(characterDescriptionLabel, then: {
            $0.anchor(.top(characterNameLabel.bottomAnchor, constant: 4),
                      .bottomGreaterThanOrEqualTo(contentView.bottomAnchor, constant: 8),
                      .leading(characterImageView.leadingAnchor),
                      .trailing(characterImageView.trailingAnchor))
            $0.centerXTo(characterNameLabel.centerXAnchor)
        })
    }
}
