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
    let name, fullname, title, description: String
    let rarity: Rarity
    let element: Element
    let weapontype: Weapontype
    let substat: String
    let gender: Gender
    let body: Body
    let association: Association
    let region: Region
    let affiliation, birthdaymmdd, birthday, constellation: String
    let cv: Cv
    let costs: Costs
    let images: Images
    let url: String?
    let version: String
}

public enum Rarity: String {
    case fiveStar = "5"
    case fourStar = "4"
}

public enum Association: String {
    case fatui = "FATUI"
    case fontaine = "FONTAINE"
    case inazuma = "INAZUMA"
    case liyue = "LIYUE"
    case mainactor = "MAINACTOR"
    case mondstadt = "MONDSTADT"
    case ranger = "RANGER"
    case sumeru = "SUMERU"
}

public enum Body: String {
    case boy = "BOY"
    case girl = "GIRL"
    case lady = "LADY"
    case loli = "LOLI"
    case male = "MALE"
}

// MARK: - Costs
public struct Costs {
    let ascend1, ascend2, ascend3, ascend4: [Ascend]
    let ascend5, ascend6: [Ascend]
}

// MARK: - Ascend
public struct Ascend: Codable {
    let name: String
    let count: Int
}

// MARK: - Cv
public struct Cv {
    let english, chinese, japanese, korean: String
}

public enum Element: String {
    case anemo = "Anemo"
    case cryo = "Cryo"
    case dendro = "Dendro"
    case electro = "Electro"
    case geo = "Geo"
    case hydro = "Hydro"
    case none = "None"
    case pyro = "Pyro"
}

public enum Gender: String {
    case female = "Female"
    case male = "Male"
}

// MARK: - Images
public struct Images {
    let image: String?
    let card: String?
    let portrait: String?
    let icon, sideicon: String
    let hoyolabAvatar: String?
    let nameicon, nameiconcard, namesideicon: String
    let cover1, cover2: String?
    let namegachasplash, namegachaslice: String?
}

public enum Region: String {
    case empty = ""
    case fontaine = "Fontaine"
    case inazuma = "Inazuma"
    case liyue = "Liyue"
    case mondstadt = "Mondstadt"
    case snezhnaya = "Snezhnaya"
    case sumeru = "Sumeru"
}

public enum Weapontype: String, Codable {
    case bow = "Bow"
    case catalyst = "Catalyst"
    case claymore = "Claymore"
    case polearm = "Polearm"
    case sword = "Sword"
}
