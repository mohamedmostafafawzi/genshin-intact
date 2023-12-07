//
//  HomeViewControllerFactory.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/19/23.
//

import Foundation

public protocol HomeViewControllerFactory {
    func makeHomeViewController() -> HomeViewController
}
