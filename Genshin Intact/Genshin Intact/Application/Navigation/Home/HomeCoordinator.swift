//
//  HomeCoordinator.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/19/23.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    // MARK: - Properties
    private let presenter: UIViewController
    private weak var navigationDelegate: HomeCoordinatorNavigationDelegate?
    
    // MARK: View controllers
    private var homeVC: HomeViewController?
    
    // MARK: Factories
    private let homeViewControllerFactory: HomeViewControllerFactory
    private let characterDetailsViewControllerFactory: CharacterDetailsViewControllerFactory
    
    // MARK: - Initializer
    init(
        presenter: UIViewController,
        navigationDelegate: HomeCoordinatorNavigationDelegate,
        homeViewControllerFactory: HomeViewControllerFactory,
        characterDetailsViewControllerFactory: CharacterDetailsViewControllerFactory
    ) {
        self.presenter = presenter
        self.navigationDelegate = navigationDelegate
        self.homeViewControllerFactory = homeViewControllerFactory
        self.characterDetailsViewControllerFactory = characterDetailsViewControllerFactory
    }
    
    func start(
        completionHandler: CoordinatorStartCompletionHandler?
    ) {
        homeVC = homeViewControllerFactory.makeHomeViewController()
        presenter.addFullScreen(childViewController: homeVC!)
        completionHandler?()
    }
    
    func finish(
        completionHandler: CoordinatorStartCompletionHandler?
    ) {
        homeVC?.removeFromParent()
        homeVC = nil
        completionHandler?()
    }
}

// MARK: - Navigation delegates
extension HomeCoordinator: HomeViewControllerNavigationDelegate {
    func viewDetails(of character: Character) {
        let characterDetailsVC = characterDetailsViewControllerFactory.makeCharacterDetailsViewController(with: character)
        presenter.present(characterDetailsVC, animated: true)
    }
}

extension HomeCoordinator: CharacterDetailsViewControllerNavigationDelegate {

}
