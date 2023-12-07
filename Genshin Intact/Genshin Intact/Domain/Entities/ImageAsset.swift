//
//  ImageAsset.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 12/5/23.
//

import Foundation

public struct ImageAsset {
    private let characterName: String
    let imageURL: String
    
    init(character: Character, assetType: AssetType) {
        guard character.name != "Traveler" else {
            self.characterName = character.name.lowercased()
            let vision = character.vision.rawValue.lowercased()
            self.imageURL = "https://api.genshin.dev/characters/\(characterName)-\(vision)/\(assetType.rawValue)-aether"
            return
        }
        
        guard !character.name.contains("Kamisato") else {
            self.characterName = character.name.components(separatedBy: " ")[1].lowercased()
            self.imageURL = "https://api.genshin.dev/characters/\(characterName)/\(assetType.rawValue)"
            return
        }
        
        self.characterName = character.name.replacingOccurrences(of: " ", with: "-").lowercased()
        self.imageURL = "https://api.genshin.dev/characters/\(characterName)/\(assetType.rawValue)"
    }

}

enum AssetType: String {
    case card
    case constellation
    case constellation1 = "constellation-1"
    case constellation2 = "constellation-2"
    case constellation3 = "constellation-3"
    case constellation4 = "constellation-4"
    case constellation5 = "constellation-5"
    case constellation6 = "constellation-6"
    case gachaCard = "gacha-card"
    case gachaSplash = "gacha-splash"
    case icon
    case iconBig = "icon-big"
    case iconSide = "icon-side"
    case portrait
    case talentBurst = "talent-burst"
    case talentNA = "talent-na"
    case talentPassive0 = "talent-passive-0"
    case talentPassive1 = "talent-passive-1"
    case talentPassive2 = "talent-passive-2"
    case talentSkill = "talent-skill"
}

