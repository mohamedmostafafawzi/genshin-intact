//
//  AppDependencyContainer.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import Foundation
import UIKit

public class AppDependencyContainer {
    
    // MARK: - Properties
    private let window: UIWindow
    private let rootVC: UIViewController
    
    // MARK: Long-lived dependencies
    private weak var sharedAppCoordinator: AppCoordinator!
    private let sharedNetworkService: NetworkService
    
    // MARK: - Initializer
    init(window: UIWindow) {
        // Initialize main properties
        self.window = window
        self.rootVC = RootViewController()
        
        // Initialize shared instances
        sharedNetworkService = MainNetworkService()
    }
    
    // MARK: - Methods
    public func makeAppCoordinator() -> AppCoordinator {
        let coordinator = AppCoordinator(
            window: window,
            rootVC: rootVC
        )
        self.sharedAppCoordinator = coordinator
        return coordinator
    }
}

