//
//  UIActivityIndicator+Styling.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import UIKit

public extension UIActivityIndicatorView {
    func style(color: UIColor? = .activityIndicator,
               style: Style = .medium) -> UIActivityIndicatorView {
        hidesWhenStopped = true
        if let color = color { self.color = color }
        self.style = style
        return self
    }
}
