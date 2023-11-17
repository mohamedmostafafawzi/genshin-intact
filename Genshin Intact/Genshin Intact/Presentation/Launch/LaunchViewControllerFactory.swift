//
//  LaunchViewControllerFactory.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import Foundation

public protocol LaunchViewControllerFactory {
    func makeLaunchViewController() -> LaunchViewController
}
