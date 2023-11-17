//
//  ContentUseCase.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/16/23.
//

import Foundation
import PromiseKit

public protocol ContentUseCase {
    func getCharacters() -> Promise<Characters>
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
    func getCharacters() -> Promise<Characters>  {
        return contentRepository.getCharacters()
    }

}
