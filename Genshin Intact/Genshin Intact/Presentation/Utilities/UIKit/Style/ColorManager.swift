//
//  ColorManager.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import UIKit

public extension UIColor {
    // TODO :- Replace colors with actual colors
    // MARK: - Text Semantic Colors
    static let headerText = evaluateColor(light: ColorPalette.primaryDark,
                                          dark: ColorPalette.white)
    static let headerPrimaryLightContentText = ColorPalette.primary
    static let primaryText = evaluateColor(light: ColorPalette.darkestGrey,
                                           dark: ColorPalette.lightestGrey)
    static let secondaryText = evaluateColor(light: ColorPalette.darkGrey,
                                             dark: ColorPalette.lightGrey)
    static let primaryButtonText = evaluateColor(light: ColorPalette.white,
                                                 dark: ColorPalette.white)
    static let headerLightContentText = ColorPalette.white
    static let primaryLightContentText = ColorPalette.lightestGrey
    static let secondaryLightContentText = ColorPalette.lightGrey
    static let primaryButtonLightContentText = ColorPalette.white
    
    // MARK: - Tint Semantic Colors
    static let primaryButton = evaluateColor(light: ColorPalette.primary,
                                             dark: ColorPalette.primary)
    static let secondaryButton = evaluateColor(light: ColorPalette.darkGrey,
                                               dark: ColorPalette.lightestGrey)
    static let tertiaryButton = evaluateColor(light: ColorPalette.grey,
                                              dark: ColorPalette.darkGrey)
    static let destructiveButton = ColorPalette.red
    static let primaryLightContentButton = ColorPalette.white
    static let primaryDarkContentButton = ColorPalette.darkestGrey
    
    // MARK: - Background Semantic Colors
    static let background = evaluateColor(light: ColorPalette.white,
                                          dark: ColorPalette.darkestGrey)
    static let secondaryBackground = evaluateColor(light: ColorPalette.lightestGrey,
                                                   dark: ColorPalette.black)
    static let primaryButtonBackground = evaluateColor(light: ColorPalette.primary,
                                                       dark: ColorPalette.primary)
    static let navigationBarBackground = evaluateColor(light: ColorPalette.white,
                                                       dark: ColorPalette.black)
    static let cardViewBackground = evaluateColor(light: ColorPalette.white,
                                                  dark: ColorPalette.darkestGrey)
    static let selectedCellBackground = ColorPalette.primaryLightest
    static let primaryButtonLightContentBackground = ColorPalette.primary
    static let darkContentBackground = ColorPalette.darkestGrey
    static let lightContentBackground = ColorPalette.lightestGrey
    
    // MARK: - TabBar Semantic Colors
    static let backgroundTabBar = evaluateColor(light: ColorPalette.white,
                                                dark: ColorPalette.black)
    static let selectedItemTabBar = evaluateColor(light: ColorPalette.primary,
                                                  dark: ColorPalette.primary)
    static let unselectedItemTabBar = evaluateColor(light: ColorPalette.darkestGrey,
                                                    dark: ColorPalette.lightestGrey)
    static let shadowTabBar = evaluateColor(light: ColorPalette.black,
                                                dark: ColorPalette.white)
    
    // MARK: - Others
    static let separator = ColorPalette.primaryLightest
    static let activeSeparator = ColorPalette.primary
    static let activityIndicator = evaluateColor(light: ColorPalette.darkGrey,
                                                 dark: ColorPalette.lightGrey)
    static let lightContentActivityIndicator = ColorPalette.white
}

/// Base palette, not visible outside this file
private struct ColorPalette {
    static let primary = #colorLiteral(red: 0.4078431373, green: 0.7176470588, blue: 0.8901960784, alpha: 1)
    static let primaryLightest = #colorLiteral(red: 0.6705882353, green: 0.8078431373, blue: 0.8862745098, alpha: 0.2)
    static let primaryDark = #colorLiteral(red: 0.007843137255, green: 0.2509803922, blue: 0.4509803922, alpha: 1)
    static let red = #colorLiteral(red: 1, green: 0.3421366231, blue: 0.1749547645, alpha: 1)
    static let black = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let darkestGrey = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
    static let darkGrey = #colorLiteral(red: 0.2650472522, green: 0.2701303959, blue: 0.2834975719, alpha: 1)
    static let grey = #colorLiteral(red: 0.5490196078, green: 0.5490196078, blue: 0.5490196078, alpha: 1)
    static let lightGrey = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    static let lightestGrey = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    static let white = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
}

// MARK: - Helpers
private func evaluateColor(light: UIColor, dark: UIColor) -> UIColor {
    return UIColor { traitCollection in
        traitCollection.userInterfaceStyle == .dark ? dark : light
    }
}
