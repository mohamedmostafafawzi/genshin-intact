//
//  CharacterDTO+Mapping.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import Foundation

// MARK: - Character
struct CharacterDTO: Codable {
    let name: String
    let title: String?
    let vision: VisionDTO
    let weapon: WeaponDTO
    let nation: NationDTO
    let affiliation: String
    let rarity: CharacterRarityDTO
    let constellation: String
    let birthday: String?
    let description: String
    let skillTalents: [SkillTalentDTO]
    let passiveTalents, constellations: [ConstellationDTO]
    let visionKey: VisionKeyDTO
    let weaponType: WeaponTypeDTO
    let gender, specialDish: String?
    let outfits: [OutfitDTO]?

    enum CodingKeys: String, CodingKey {
        case name, title, vision, weapon, nation, affiliation, rarity, constellation, birthday, description, skillTalents, passiveTalents, constellations
        case visionKey = "vision_key"
        case weaponType = "weapon_type"
        case gender, specialDish, outfits
    }
}

extension CharacterDTO {
    func toDomain() -> Character {
        return Character(
            name: name,
            title: title,
            vision: vision.toDomain(),
            weapon: weapon.toDomain(),
            nation: nation.toDomain(),
            affiliation: affiliation,
            rarity: rarity.toDomain(),
            constellation: constellation,
            birthday: birthday,
            description: description,
            skillTalents: skillTalents.map { $0.toDomain() },
            passiveTalents: passiveTalents.map { $0.toDomain() },
            constellations: constellations.map { $0.toDomain() },
            visionKey: visionKey.toDomain(),
            weaponType: weaponType.toDomain(),
            gender: gender,
            specialDish: specialDish,
            outfits: outfits?.map { $0.toDomain() }
        )
    }
}


// MARK: - Constellation
struct ConstellationDTO: Codable {
    let name: String
    let unlock: ConstellationUnlockDTO
    let description: String
    let level: Int?
}

extension ConstellationDTO {
    func toDomain() -> Constellation {
        return Constellation(
            name: name,
            unlock: unlock.toDomain(),
            description: description,
            level: level
        )
    }
}

enum ConstellationUnlockDTO: String, Codable {
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

extension ConstellationUnlockDTO {
    func toDomain() -> ConstellationUnlock {
        switch self {
        case .constellationLV1: return .constellationLV1
        case .constellationLV2: return .constellationLV2
        case .constellationLV3: return .constellationLV3
        case .constellationLV4: return .constellationLV4
        case .constellationLV5: return .constellationLV5
        case .constellationLV6: return .constellationLV6
        case .unlockedAtAscension1: return .unlockedAtAscension1
        case .unlockedAtAscension4: return .unlockedAtAscension4
        case .unlockedAutomatically: return .unlockedAutomatically
        }
    }
}

enum NationDTO: String, Codable {
    case inazuma = "Inazuma"
    case liyue = "Liyue"
    case mondstadt = "Mondstadt"
    case outlander = "Outlander"
    case snezhnaya = "Snezhnaya"
    case sumeru = "Sumeru"
    case fontaine = "Fontaine"
    case unknown = "Unknown"
}

extension NationDTO {
    func toDomain() -> Nation {
        return Nation(rawValue: rawValue) ?? .unknown
    }
}

enum CharacterRarityDTO: Int, Codable {
    case fourStar = 4
    case fiveStar = 5
}

extension CharacterRarityDTO {
    func toDomain() -> CharacterRarity {
        switch self {
        case .fourStar: return .fourStar
        case .fiveStar: return .fiveStar
        }
    }
}


// MARK: - Outfit
struct OutfitDTO: Codable {
    let type, name, description: String?
    let rarity, price: Int?
    let image: String?
}

extension OutfitDTO {
    func toDomain() -> Outfit {
        return Outfit(
            type: type,
            name: name,
            description: description,
            rarity: rarity,
            price: price,
            image: image
        )
    }
}


// MARK: - SkillTalent
struct SkillTalentDTO: Codable {
    let name: String
    let unlock: SkillTalentUnlockDTO
    let description: String
    let type: TypeEnumDTO?
    let upgrades: [UpgradeDTO]?
}

extension SkillTalentDTO {
    func toDomain() -> SkillTalent {
        return SkillTalent(
            name: name,
            unlock: unlock.toDomain(),
            description: description,
            type: type?.toDomain(),
            upgrades: upgrades?.map { $0.toDomain() } ?? []
        )
    }
}

enum TypeEnumDTO: String, Codable {
    case elementalBurst = "ELEMENTAL_BURST"
    case elementalSkill = "ELEMENTAL_SKILL"
    case normalAttack = "NORMAL_ATTACK"
}

extension TypeEnumDTO {
    func toDomain() -> TypeEnum {
        switch self {
        case .elementalBurst: return .elementalBurst
        case .elementalSkill: return .elementalSkill
        case .normalAttack: return .normalAttack
        }
    }
}

enum SkillTalentUnlockDTO: String, Codable {
    case elementalBurst = "Elemental Burst"
    case elementalSkill = "Elemental Skill"
    case normalAttack = "Normal Attack"
    case rightClick = "Right Click"
    case unlockElementalBurst = "Elemental burst"
    case unlockElementalSkill = "Elemental skill"
    case unlockNormalAttack = "Normal attack"
}

extension SkillTalentUnlockDTO {
    func toDomain() -> SkillTalentUnlock {
        switch self {
        case .elementalBurst: return .elementalBurst
        case .elementalSkill: return .elementalSkill
        case .normalAttack: return .normalAttack
        case .rightClick: return .rightClick
        case .unlockElementalBurst: return .unlockElementalBurst
        case .unlockElementalSkill: return .unlockElementalSkill
        case .unlockNormalAttack: return .unlockNormalAttack
        }
    }
}

// MARK: - Upgrade
struct UpgradeDTO: Codable {
    let name, value: String
}

extension UpgradeDTO {
    func toDomain() -> Upgrade {
        return Upgrade(name: name, value: value)
    }
}

enum VisionDTO: String, Codable {
    case anemo = "Anemo"
    case cryo = "Cryo"
    case dendro = "Dendro"
    case electro = "Electro"
    case geo = "Geo"
    case hydro = "Hydro"
    case pyro = "Pyro"
}

extension VisionDTO {
    func toDomain() -> Vision {
        switch self {
        case .anemo: return .anemo
        case .cryo: return .cryo
        case .dendro: return .dendro
        case .electro: return .electro
        case .geo: return .geo
        case .hydro: return .hydro
        case .pyro: return .pyro
        }
    }
}

enum VisionKeyDTO: String, Codable {
    case anemo = "ANEMO"
    case cryo = "CRYO"
    case dendro = "DENDRO"
    case electro = "ELECTRO"
    case geo = "GEO"
    case hydro = "HYDRO"
    case pyro = "PYRO"
}

extension VisionKeyDTO {
    func toDomain() -> VisionKey {
        switch self {
        case .anemo: return .anemo
        case .cryo: return .cryo
        case .dendro: return .dendro
        case .electro: return .electro
        case .geo: return .geo
        case .hydro: return .hydro
        case .pyro: return .pyro
        }
    }
}

enum WeaponDTO: String, Codable {
    case bow = "Bow"
    case catalyst = "Catalyst"
    case claymore = "Claymore"
    case polearm = "Polearm"
    case sword = "Sword"
}

extension WeaponDTO {
    func toDomain() -> Weapon {
        switch self {
        case .bow: return .bow
        case .catalyst: return .catalyst
        case .claymore: return .claymore
        case .polearm: return .polearm
        case .sword: return .sword
        }
    }
}


enum WeaponTypeDTO: String, Codable {
    case bow = "BOW"
    case catalyst = "CATALYST"
    case claymore = "CLAYMORE"
    case polearm = "POLEARM"
    case sword = "SWORD"
}

extension WeaponTypeDTO {
    func toDomain() -> WeaponType {
        switch self {
        case .bow: return .bow
        case .catalyst: return .catalyst
        case .claymore: return .claymore
        case .polearm: return .polearm
        case .sword: return .sword
        }
    }
}

