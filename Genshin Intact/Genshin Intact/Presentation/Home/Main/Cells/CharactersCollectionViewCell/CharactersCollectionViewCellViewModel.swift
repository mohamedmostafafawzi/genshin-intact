//
//  CharactersCollectionViewCellViewModel.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 12/5/23.
//

import Foundation

struct CharactersCollectionViewCellViewModel {
    
    // MARK: - Properties
    let title: String
    let subtitle: String?
    let imageURL: String?
    let rarity: CharacterRarity
    let vision: Vision
    let object: Character
    
    // MARK: - Initialzier
    init(from character: Character) {
        self.title = character.name
        self.subtitle = character.affiliation
        self.imageURL = ImageAsset(character: character, assetType: .iconBig).imageURL
        self.rarity = character.rarity
        self.vision = character.vision
        self.object = character
    }
}
