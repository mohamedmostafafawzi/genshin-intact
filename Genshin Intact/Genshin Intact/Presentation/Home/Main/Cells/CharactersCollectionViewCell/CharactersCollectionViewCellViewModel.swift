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
    let imageURL: String?
    let rarity: Rarity
    let element: Element
    let object: Character
    
    // MARK: - Initialzier
    init(from character: Character) {
        self.title = character.name
        self.imageURL = character.images.icon
        self.rarity = character.rarity
        self.element = character.element
        self.object = character
    }
}
