//
//  UISearchBar+Styling.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import UIKit

public extension UISearchBar {
    func style(
        placeholder: String,
        font: UIFont,
        textColor: UIColor
    ) -> Self {
        self.placeholder = placeholder
        self.searchTextField.font = font
        self.searchTextField.textColor = textColor
        self.backgroundImage = UIImage()
        return self
    }
}
