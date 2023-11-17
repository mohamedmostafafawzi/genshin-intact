//
//  RootViewController.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import UIKit

class RootViewController: NiblessViewController {
    
    // MARK: - Properties
    public override var childForStatusBarStyle: UIViewController? {
        return children.first
    }

    open override var childForStatusBarHidden: UIViewController? {
        return children.first
    }
}
