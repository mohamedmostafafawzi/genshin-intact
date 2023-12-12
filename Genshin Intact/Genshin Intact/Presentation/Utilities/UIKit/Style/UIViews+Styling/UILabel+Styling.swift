//
//  UILabel+Styling.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import UIKit

public extension UILabel {
    func style(font: UIFont,
               textColor: UIColor,
               textAlignment: NSTextAlignment = .natural,
               numberOfLines: Int = 0,
               text: String? = nil,
               shrinkTextToFit: Bool = false) -> Self {
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.text = text
        self.adjustsFontSizeToFitWidth = shrinkTextToFit
        return self
    }
}
