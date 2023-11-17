//
//  AppCoordinator.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import UIKit

public class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    private let window: UIWindow
    private let rootVC: UIViewController

    // MARK: Child coordinators
    private var launchCoordinator: LaunchCoordinator?
    
    // MARK: Factories
    private let launchCoordinatorFactory: LaunchCoordinatorFactory
    
    // MARK: - Initializer
    init(
        window: UIWindow,
        rootVC: UIViewController,
        launchCoordinatorFactory: LaunchCoordinatorFactory
    ) {
        self.window = window
        self.rootVC = rootVC
        self.launchCoordinatorFactory = launchCoordinatorFactory
    }
    
    // MARK: - Methods
    public func start(
        completionHandler: CoordinatorStartCompletionHandler?
    ) {
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
        goToLaunchView()
        completionHandler?()
    }
    
    public func finish(
        completionHandler: CoordinatorStartCompletionHandler?
    ) {
        completionHandler?()
    }
    
    private func goToLaunchView() {
        launchCoordinator = launchCoordinatorFactory.makeLaunchCoordinator()
        launchCoordinator?.start()
    }
    
}

extension AppCoordinator: LaunchCoordinatorNavigationDelegate {
    func goToHomeView() {
        
    }
}
