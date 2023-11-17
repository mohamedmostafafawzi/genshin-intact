//
//  ColorManager.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import UIKit

public extension UIColor {
    // TODO :- Replace colors with actual colors
    // MARK: - Element Semantic Colors
    static let pyro = ColorPalette.pyro
    static let hydro = ColorPalette.hydro
    static let geo = ColorPalette.geo
    static let electro = ColorPalette.electro
    static let anemo = ColorPalette.anemo
    static let dendro = ColorPalette.dendro
    static let cryo = ColorPalette.cryo
    
    // MARK: - Text Semantic Colors
    static let headerText = evaluateColor(light: ColorPalette.black,
                                          dark: ColorPalette.white)
    static let headerPrimaryLightContentText = ColorPalette.black
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
    static let primaryButton = evaluateColor(light: ColorPalette.pyro,
                                             dark: ColorPalette.pyro)
    static let secondaryButton = evaluateColor(light: ColorPalette.darkGrey,
                                               dark: ColorPalette.lightestGrey)
    static let tertiaryButton = evaluateColor(light: ColorPalette.grey,
                                              dark: ColorPalette.darkGrey)
    static let destructiveButton = ColorPalette.pyro
    static let primaryLightContentButton = ColorPalette.white
    static let primaryDarkContentButton = ColorPalette.darkestGrey
    
    // MARK: - Background Semantic Colors
    static let background = evaluateColor(light: ColorPalette.white,
                                          dark: ColorPalette.darkestGrey)
    static let secondaryBackground = evaluateColor(light: ColorPalette.lightestGrey,
                                                   dark: ColorPalette.black)
    static let primaryButtonBackground = evaluateColor(light: ColorPalette.pyro,
                                                       dark: ColorPalette.pyro)
    static let navigationBarBackground = evaluateColor(light: ColorPalette.white,
                                                       dark: ColorPalette.black)
    static let cardViewBackground = evaluateColor(light: ColorPalette.white,
                                                  dark: ColorPalette.darkestGrey)
    static let selectedCellBackground = ColorPalette.pyro
    static let primaryButtonLightContentBackground = ColorPalette.pyro
    static let darkContentBackground = ColorPalette.darkestGrey
    static let lightContentBackground = ColorPalette.lightestGrey
    
    // MARK: - TabBar Semantic Colors
    static let backgroundTabBar = evaluateColor(light: ColorPalette.white,
                                                dark: ColorPalette.black)
    static let selectedItemTabBar = evaluateColor(light: ColorPalette.pyro,
                                                  dark: ColorPalette.pyro)
    static let unselectedItemTabBar = evaluateColor(light: ColorPalette.darkestGrey,
                                                    dark: ColorPalette.lightestGrey)
    static let shadowTabBar = evaluateColor(light: ColorPalette.black,
                                                dark: ColorPalette.white)
    
    // MARK: - Others
    static let separator = ColorPalette.darkGrey
    static let activeSeparator = ColorPalette.grey
    static let activityIndicator = evaluateColor(light: ColorPalette.darkGrey,
                                                 dark: ColorPalette.lightGrey)
    static let launchIcon = evaluateColor(light: ColorPalette.darkGrey,
                                                 dark: ColorPalette.lightGrey)
    static let lightContentActivityIndicator = ColorPalette.white
}

/// Base palette, not visible outside this file
private struct ColorPalette {
    // Elements
    static let pyro = UIColor(hex: "EC4923")
    static let hydro = UIColor(hex: "00BFFF")
    static let geo = UIColor(hex: "EC4923")
    static let electro = UIColor(hex: "945dc4")
    static let anemo = UIColor(hex: "359697")
    static let dendro = UIColor(hex: "608a00")
    static let cryo = UIColor(hex: "4682B4")
    
    // Shades of black
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
