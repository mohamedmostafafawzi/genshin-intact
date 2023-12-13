//
//  FontManager.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import UIKit

// MARK: - Font Parts
public extension UIFont {
    enum FontWeight: String {
        case regular = "HYWenHei"
    }

    enum FontSize: CGFloat {
        case h1 = 30, h2 = 24, h3 = 18
        case bodyL = 16, bodyM = 14, bodyS = 11
    }
    
    static func getCustomFont(weight: FontWeight, size: CGFloat, scalable: Bool) -> UIFont {
        guard let customFont = UIFont(name: weight.rawValue, size: size) else {
            fatalError("Failed to load the \(weight.rawValue) font")
        }
        
        if scalable {
            let fontMetrics = UIFontMetrics(forTextStyle: .body)
            return fontMetrics.scaledFont(for: customFont)
        } else {
            return customFont
        }
    }
    
    /// Weight: 400
    static func regular(size: FontSize, scalable: Bool = false) -> UIFont {
        return getCustomFont(weight: .regular,
                             size: CGFloat(size.rawValue),
                             scalable: scalable)
    }
}
