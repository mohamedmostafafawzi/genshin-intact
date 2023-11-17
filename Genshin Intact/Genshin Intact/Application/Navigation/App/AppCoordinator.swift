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

    // MARK: - Initializer
    init(
        window: UIWindow,
        rootVC: UIViewController
    ) {
        self.window = window
        self.rootVC = rootVC
    }
    
    // MARK: - Methods
    public func start(
        completionHandler: CoordinatorStartCompletionHandler?
    ) {
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
        completionHandler?()
    }
    
    public func finish(
        completionHandler: CoordinatorStartCompletionHandler?
    ) {
        completionHandler?()
    }
    
}
