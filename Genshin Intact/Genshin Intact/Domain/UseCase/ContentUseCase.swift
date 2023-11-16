//
//  ContentUseCase.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/16/23.
//

import Foundation
import PromiseKit

public protocol ContentUseCase {
    func getContent(type: GenshinContentType) -> Promise<[String]> 
}

final class MainContentUseCase: ContentUseCase {
    
    // MARK: - Properties
    private let contentRepository: ContentRepository
    
    // MARK: - Initializer
    init(
        contentRepository: ContentRepository
    ) {
        self.contentRepository = contentRepository
    }
    
    // MARK: - Methods
    func getContent(type: GenshinContentType) -> Promise<[String]> {
        return contentRepository.getContent(type: type)
    }

}
