//
//  Character.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import Foundation

public typealias Characters = [Character]

// MARK: - Character
public struct Character {
    let name: String
    let title: String?
    let vision: Vision
    let weapon: Weapon
    let nation: Nation
    let affiliation: String
    let rarity: CharacterRarity
    let constellation: String
    let birthday: String?
    let description: String
    let skillTalents: [SkillTalent]
    let passiveTalents, constellations: [Constellation]
    let visionKey: VisionKey
    let weaponType: WeaponType
    let gender: Gender
    let specialDish: String?
    let outfits: [Outfit]?
}

// MARK: - Constellation
public struct Constellation {
    let name: String
    let unlock: ConstellationUnlock
    let description: String
    let level: Int?
}

public enum ConstellationUnlock: String {
    case constellationLV1 = "Constellation Lv. 1"
    case constellationLV2 = "Constellation Lv. 2"
    case constellationLV3 = "Constellation Lv. 3"
    case constellationLV4 = "Constellation Lv. 4"
    case constellationLV5 = "Constellation Lv. 5"
    case constellationLV6 = "Constellation Lv. 6"
    case unlockedAtAscension1 = "Unlocked at Ascension 1"
    case unlockedAtAscension4 = "Unlocked at Ascension 4"
    case unlockedAutomatically = "Unlocked Automatically"
}

public enum Nation: String {
    case inazuma = "Inazuma"
    case liyue = "Liyue"
    case mondstadt = "Mondstadt"
    case outlander = "Outlander"
    case snezhnaya = "Snezhnaya"
    case sumeru = "Sumeru"
    case fontaine = "Fontaine"
    case unknown = "Unknown"
}

public enum CharacterRarity: Int {
    case fourStar = 4
    case fiveStar = 5
}

// MARK: - Outfit
public struct Outfit {
    let type, name, description: String?
    let rarity, price: Int?
    let image: String?
}

// MARK: - SkillTalent
public struct SkillTalent {
    let name: String
    let unlock: SkillTalentUnlock
    let description: String
    let type: TypeEnum?
    let upgrades: [Upgrade]?
}

public enum TypeEnum: String {
    case elementalBurst = "ELEMENTAL_BURST"
    case elementalSkill = "ELEMENTAL_SKILL"
    case normalAttack = "NORMAL_ATTACK"
}

public enum SkillTalentUnlock: String {
    case elementalBurst = "Elemental Burst"
    case elementalSkill = "Elemental Skill"
    case normalAttack = "Normal Attack"
    case rightClick = "Right Click"
    case unlockElementalBurst = "Elemental burst"
    case unlockElementalSkill = "Elemental skill"
    case unlockNormalAttack = "Normal attack"
}

// MARK: - Upgrade
public struct Upgrade {
    let name, value: String
}

public enum Vision: String {
    case anemo = "Anemo"
    case cryo = "Cryo"
    case dendro = "Dendro"
    case electro = "Electro"
    case geo = "Geo"
    case hydro = "Hydro"
    case pyro = "Pyro"
}

public enum VisionKey: String {
    case anemo = "ANEMO"
    case cryo = "CRYO"
    case dendro = "DENDRO"
    case electro = "ELECTRO"
    case geo = "GEO"
    case hydro = "HYDRO"
    case pyro = "PYRO"
}

public enum Weapon: String {
    case bow = "Bow"
    case catalyst = "Catalyst"
    case claymore = "Claymore"
    case polearm = "Polearm"
    case sword = "Sword"
}

public enum WeaponType: String {
    case bow = "BOW"
    case catalyst = "CATALYST"
    case claymore = "CLAYMORE"
    case polearm = "POLEARM"
    case sword = "SWORD"
}

public enum Gender: String {
    case male = "Male"
    case female = "Female"
    case unknown
}
