//
//  MainContentRepository.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/16/23.
//

import Foundation
import PromiseKit

public final class MainContentRepository: ContentRepository {
    
    // MARK: - Properties
    private let networkService: NetworkService
    
    // MARK: - Initializer
    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - Methods
    public func getCharacters() -> Promise<Characters> {
        func getCharactersResponse() -> Promise<[CharacterDTO]> {
            return networkService.fetchRequest(forRoute: ContentRouter.getCharacters)
        }
        return getCharactersResponse().map { $0.map { $0.toDomain() } }
    }
}
