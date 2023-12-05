//
//  CharactersCollectionViewCellViewModel.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 12/5/23.
//

import Foundation

struct CharactersCollectionViewCellViewModel {
    
    // MARK: - Properties
    let characterName: String
    let characterDescription: String?
    let imageURL: String?
    let characterObject: Character
    
    // MARK: - Initialzier
    init(from character: Character) {
        self.characterName = character.name
        self.characterDescription = character.description
        self.imageURL = ImageAsset(character: character, assetType: .iconBig).imageURL
        self.characterObject = character

    }
}
