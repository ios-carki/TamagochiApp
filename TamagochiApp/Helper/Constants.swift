//
//  Constants.swift
//  TamagochiApp
//
//  Created by Carki on 2023/03/11.
//

import Foundation

enum CustomButtonType {
    case ok
    case cancel
    case transparent
}

enum CustomTextType {
    case just
    case detail
}

enum ColorHex: String{
    case vermillion = "#E64C0E"
    case darkBlue = "#26354C"
    case blueGray = "#7d90A5"
    case milkWhite = "#7F5F5F5"
    case realBlack = "#000000"
    case realWhite = "#FFFFFF"
    case angryRed = "#FA0606"
    case shinyGreen = "#00FF00"
}

enum UserDefaultKeys: String, CaseIterable {
    case tamagochiImage
    case tamagochiName
    
    case gameStatus // cancel - false, start - true
}
