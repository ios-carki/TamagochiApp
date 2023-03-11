//
//  Color+Extension.swift
//  TamagochiApp
//
//  Created by Carki on 2023/03/11.
//

import SwiftUI

extension Color {
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
    
    var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
    
    static let backgroundColor = Color(#colorLiteral(red: 0.9682556987, green: 0.9902593493, blue: 0.9907154441, alpha: 1))
    static let textColor = Color(#colorLiteral(red: 0.3713189363, green: 0.4910926223, blue: 0.5447365046, alpha: 1))
    
    static let cancelBackground = Color(hex: "#DDE9EB")
    
    static let primaryBlue = Color(hex: "#3434FD")
    static let textContentGray = Color(hex: "#5c5c5c")
    static let blackModeWhite = Color(hex: "#f5f5f5")
    
    static let mPrimary = Color(hex: ColorHex.vermillion.rawValue)
    static let onPrimary = Color(hex: ColorHex.milkWhite.rawValue)

    static let mSecondary = Color(hex: ColorHex.darkBlue.rawValue)
    static let onSecondary = Color(hex: ColorHex.realWhite.rawValue)

    static let background = Color(hex: ColorHex.realWhite.rawValue)
    static let onBackground = Color(hex: ColorHex.realBlack.rawValue)
    
    static let surface = Color(hex: ColorHex.realWhite.rawValue)
    static let onSurface = Color(hex: ColorHex.realBlack.rawValue)

    static let primaryVariant = Color(hex: ColorHex.blueGray.rawValue)
    
    static let angryRed = Color(hex: ColorHex.angryRed.rawValue)
    static let shinyGreen = Color(hex: ColorHex.shinyGreen.rawValue)
}
