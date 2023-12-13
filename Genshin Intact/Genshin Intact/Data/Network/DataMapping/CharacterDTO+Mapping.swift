//
//  CharacterDTO+Mapping.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import Foundation

// MARK: - Character
struct CharacterDTO: Codable {
    let name, fullname, title, description: String
    let rarity: RarityDTO
    let element: ElementDTO
    let weapontype: WeapontypeDTO
    let substat: String
    let gender: GenderDTO
    let body: BodyDTO
    let association: AssociationDTO
    let region: RegionDTO
    let affiliation, birthdaymmdd, birthday, constellation: String
    let cv: CvDTO
    let costs: CostsDTO
    let images: ImagesDTO
    let url: URLClassDTO?
    let version: String
}

extension CharacterDTO {
    func toDomain() -> Character {
        .init(
            name: name,
            fullname: fullname,
            title: title,
            description: description,
            rarity: rarity.toDomain(),
            element: element.toDomain(),
            weapontype: weapontype.toDomain(),
            substat: substat,
            gender: gender.toDomain(),
            body: body.toDomain(),
            association: association.toDomain(),
            region: region.toDomain(),
            affiliation: affiliation,
            birthdaymmdd: birthdaymmdd,
            birthday: birthday,
            constellation: constellation,
            cv: cv.toDomain(),
            costs: costs.toDomain(),
            images: images.toDomain(),
            url: url?.fandom,
            version: version
        )
    }
}

enum RarityDTO: String, Codable {
    case fiveStar = "5"
    case fourStar = "4"
}

extension RarityDTO {
    func toDomain() -> Rarity {
        switch self {
        case .fiveStar: return .fiveStar
        case .fourStar: return .fourStar
        }
    }
}

enum AssociationDTO: String, Codable {
    case fatui = "FATUI"
    case fontaine = "FONTAINE"
    case inazuma = "INAZUMA"
    case liyue = "LIYUE"
    case mainactor = "MAINACTOR"
    case mondstadt = "MONDSTADT"
    case ranger = "RANGER"
    case sumeru = "SUMERU"
}

extension AssociationDTO {
    func toDomain() -> Association {
        switch self {
        case .fatui: return .fatui
        case .fontaine: return .fontaine
        case .inazuma: return .inazuma
        case .liyue: return .liyue
        case .mainactor: return .mainactor
        case .mondstadt: return .mondstadt
        case .ranger: return .ranger
        case .sumeru: return .sumeru
        }
    }
}

enum BodyDTO: String, Codable {
    case boy = "BOY"
    case girl = "GIRL"
    case lady = "LADY"
    case loli = "LOLI"
    case male = "MALE"
}

extension BodyDTO {
    func toDomain() -> Body {
        switch self {
        case .boy: return .boy
        case .girl: return .girl
        case .lady: return .lady
        case .loli: return .loli
        case .male: return .male
        }
    }
}

// MARK: - Costs
struct CostsDTO: Codable {
    let ascend1, ascend2, ascend3, ascend4: [Ascend]
    let ascend5, ascend6: [Ascend]
}

extension CostsDTO {
    func toDomain() -> Costs {
        .init(ascend1: ascend1, ascend2: ascend2, ascend3: ascend3, ascend4: ascend4,
              ascend5: ascend5, ascend6: ascend6)
    }
}
// MARK: - Ascend
struct AscendDTO: Codable {
    let name: String
    let count: Int
}

extension AscendDTO {
    func toDomain() -> Ascend {
        .init(name: name, count: count)
    }
}

// MARK: - Cv
struct CvDTO: Codable {
    let english, chinese, japanese, korean: String
}

extension CvDTO {
    func toDomain() -> Cv {
        .init(english: english, chinese: chinese,
              japanese: japanese, korean: korean)
    }
}

enum ElementDTO: String, Codable {
    case anemo = "Anemo"
    case cryo = "Cryo"
    case dendro = "Dendro"
    case electro = "Electro"
    case geo = "Geo"
    case hydro = "Hydro"
    case none = "None"
    case pyro = "Pyro"
}

extension ElementDTO {
    func toDomain() -> Element {
        switch self {
        case .anemo: return .anemo
        case .cryo: return .cryo
        case .dendro: return .dendro
        case .electro: return .electro
        case .geo: return .geo
        case .hydro: return .hydro
        case .none: return .none
        case .pyro: return .pyro
        }
    }
}

enum GenderDTO: String, Codable {
    case female = "Female"
    case male = "Male"
}

extension GenderDTO {
    func toDomain() -> Gender {
        switch self {
        case .female: return .female
        case .male: return .male
        }
    }
}

// MARK: - Images
struct ImagesDTO: Codable {
    let image: String?
    let card: String?
    let portrait: String?
    let icon, sideicon: String
    let hoyolabAvatar: String?
    let nameicon, nameiconcard, namesideicon: String
    let cover1, cover2: String?
    let namegachasplash, namegachaslice: String?

    enum CodingKeys: String, CodingKey {
        case image, card, portrait, icon, sideicon
        case hoyolabAvatar = "hoyolab-avatar"
        case nameicon, nameiconcard, namesideicon, cover1, cover2, namegachasplash, namegachaslice
    }
}

extension ImagesDTO {
    func toDomain() -> Images {
        .init(image: image, card: card, portrait: portrait, icon: icon, sideicon: sideicon, hoyolabAvatar: hoyolabAvatar,
              nameicon: nameicon, nameiconcard: nameiconcard, namesideicon: namesideicon, cover1: cover1, cover2: cover2,
              namegachasplash: namegachasplash, namegachaslice: namegachaslice)
    }
}

enum RegionDTO: String, Codable {
    case empty = ""
    case fontaine = "Fontaine"
    case inazuma = "Inazuma"
    case liyue = "Liyue"
    case mondstadt = "Mondstadt"
    case snezhnaya = "Snezhnaya"
    case sumeru = "Sumeru"
}

extension RegionDTO {
    func toDomain() -> Region {
        switch self {
        case .empty: return .empty
        case .fontaine: return .fontaine
        case .inazuma: return .inazuma
        case .liyue: return .liyue
        case .mondstadt: return .mondstadt
        case .snezhnaya: return .snezhnaya
        case .sumeru: return .sumeru
        }
    }
}

// MARK: - URLClass
struct URLClassDTO: Codable {
    let fandom: String
}

enum WeapontypeDTO: String, Codable {
    case bow = "Bow"
    case catalyst = "Catalyst"
    case claymore = "Claymore"
    case polearm = "Polearm"
    case sword = "Sword"
}
extension WeapontypeDTO {
    func toDomain() -> Weapontype {
        switch self {
        case .bow: return .bow
        case .catalyst: return .catalyst
        case .claymore: return .claymore
        case .polearm: return .polearm
        case .sword: return .sword
        }
    }
}
