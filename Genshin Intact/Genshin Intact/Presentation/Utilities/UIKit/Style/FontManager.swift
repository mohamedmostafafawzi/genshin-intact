//
//  FontManager.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import UIKit

// MARK: - Font Parts
public extension UIFont {
// TODO :- Replace font "SourceSansPro" with actual font
    enum FontWeight: String {
        case extraLight = "SourceSansPro-ExtraLight"
        case extraLightItalic = "SourceSansPro-ExtraLightItalic"
        case light = "SourceSansPro-Light"
        case lightItalic = "SourceSansPro-LightItalic"
        case regular = "SourceSansPro-Regular"
        case italic = "SourceSansPro-Italic"
        case semiBold = "SourceSansPro-SemiBold"
        case semiBoldItalic = "SourceSansPro-SemiBoldItalic"
        case bold = "SourceSansPro-Bold"
        case boldItalic = "SourceSansPro-BoldItalic"
        case black = "SourceSansPro-Black"
        case blackItalic = "SourceSansPro-BlackItalic"
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
    
    /// Weight: 200
    static func extraLight(size: FontSize, italic: Bool = false, scalable: Bool = false) -> UIFont {
        return getCustomFont(weight: italic ? .extraLightItalic : .extraLight,
                             size: CGFloat(size.rawValue),
                             scalable: scalable)
    }
    
    /// Weight: 300
    static func light(size: FontSize, italic: Bool = false, scalable: Bool = false) -> UIFont {
        return getCustomFont(weight: italic ? .lightItalic : .light,
                             size: CGFloat(size.rawValue),
                             scalable: scalable)
    }
    
    /// Weight: 400
    static func regular(size: FontSize, italic: Bool = false, scalable: Bool = false) -> UIFont {
        return getCustomFont(weight: italic ? .italic : .regular,
                             size: CGFloat(size.rawValue),
                             scalable: scalable)
    }
    
    /// Weight: 600
    static func semiBold(size: FontSize, italic: Bool = false, scalable: Bool = false) -> UIFont {
        return getCustomFont(weight: italic ? .semiBoldItalic : .semiBold,
                             size: CGFloat(size.rawValue),
                             scalable: scalable)
    }
    
    /// Weight: 700
    static func bold(size: FontSize, italic: Bool = false, scalable: Bool = false) -> UIFont {
        return getCustomFont(weight: italic ? .boldItalic : .bold,
                             size: CGFloat(size.rawValue),
                             scalable: scalable)
    }
    
    /// Weight: 900
    static func black(size: FontSize, italic: Bool = false, scalable: Bool = false) -> UIFont {
        return getCustomFont(weight: italic ? .blackItalic : .black,
                             size: CGFloat(size.rawValue),
                             scalable: scalable)
    }
}
