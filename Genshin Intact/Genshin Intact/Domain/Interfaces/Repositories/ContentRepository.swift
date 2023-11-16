//
//  ContentRepository.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/16/23.
//

import Foundation
import PromiseKit

protocol ContentRepository {
    func getContent(type: GenshinContentType) -> Promise<[String]>
}
