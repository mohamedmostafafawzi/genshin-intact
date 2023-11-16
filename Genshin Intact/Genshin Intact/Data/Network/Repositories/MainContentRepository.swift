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
    public func getContent(type: GenshinContentType) -> Promise<[String]> {
        func getContentResponse() -> Promise<[String]> {
            return networkService.fetchRequest(forRoute: ContentRouter.getContent(type: type))
        }
        return getContentResponse()
    }
}
