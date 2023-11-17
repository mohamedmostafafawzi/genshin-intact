//
//  DependencyContainer.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import Foundation

protocol DependencyContainer: AnyObject {
    associatedtype CoordinatorType: AnyObject, Coordinator

    func makeAndStoreCoordinator() -> CoordinatorType
}
