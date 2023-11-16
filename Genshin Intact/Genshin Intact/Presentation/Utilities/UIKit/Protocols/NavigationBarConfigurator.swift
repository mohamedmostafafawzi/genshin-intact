//
//  NavigationBarConfigurator.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import Foundation
import UIKit

/// Protocol that handles configuring navigation bar properties inside NavigationController
@objc public protocol NavigationBarConfigurator {
    var showsNavigationBar: Bool { get }
    var navigationBarTitle: String? { get }
}
