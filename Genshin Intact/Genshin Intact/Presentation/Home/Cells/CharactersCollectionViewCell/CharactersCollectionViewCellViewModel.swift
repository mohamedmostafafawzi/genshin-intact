//
//  CharactersCollectionViewCellViewModel.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 12/5/23.
//

import Foundation

struct CharactersCollectionViewCellViewModel {
    
    // MARK: - Properties
    let name: String
    let description: String?
    let imageURL: String?
    let rarity: CharacterRarity
    let object: Character
    
    // MARK: - Initialzier
    init(from character: Character) {
        self.name = character.name
        self.description = character.description
        self.imageURL = ImageAsset(character: character, assetType: .iconBig).imageURL
        self.rarity = character.rarity
        self.object = character
    }
}
