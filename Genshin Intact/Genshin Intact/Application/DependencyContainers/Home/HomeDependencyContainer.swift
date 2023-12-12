//
//  HomeDependencyContainer.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/19/23.
//

import UIKit

class HomeDependencyContainer: DependencyContainer {
    
    // MARK: - Properties
    private weak var coordinator: HomeCoordinator!
    private weak var homeCoordinatorNavigationDelegate: HomeCoordinatorNavigationDelegate!
    private let presenter: UIViewController
    private let sharedContentRepository: ContentRepository
    
    // MARK: - Initializer
    init(
        presenter: UIViewController,
        homeCoordinatorNavigationDelegate: HomeCoordinatorNavigationDelegate,
        contentRepository: ContentRepository
    ) {
        self.presenter = presenter
        self.homeCoordinatorNavigationDelegate = homeCoordinatorNavigationDelegate
        self.sharedContentRepository = contentRepository
    }
    
    // MARK: - Methods
    func makeAndStoreCoordinator() -> HomeCoordinator {
        let coordinator = HomeCoordinator(
            presenter: presenter,
            navigationDelegate: homeCoordinatorNavigationDelegate,
            homeViewControllerFactory: self, 
            characterDetailsViewControllerFactory: self
        )
        self.coordinator = coordinator
        return coordinator
    }
}

// MARK: - Factories
extension HomeDependencyContainer: HomeViewControllerFactory {
    func makeHomeViewController() -> HomeViewController {
        return HomeViewController(
            viewModel: makeHomeViewModel(),
            navigationDelegate: coordinator
        )
    }
    
    private func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel(
            navigationDelegate: coordinator,
            contentUseCase: MainContentUseCase(contentRepository: sharedContentRepository)
        )
    }
}

extension HomeDependencyContainer: CharacterDetailsViewControllerFactory {
    func makeCharacterDetailsViewController(with character: Character) -> CharacterDetailsViewController {
        return CharacterDetailsViewController(
            viewModel: makeCharacterDetailsViewModel(with: character),
            navigationDelegate: coordinator
        )
    }
    
    private func makeCharacterDetailsViewModel(with character: Character) -> CharacterDetailsViewModel {
        return CharacterDetailsViewModel(
            character: character,
            navigationDelegate: coordinator
        )
    }
}
