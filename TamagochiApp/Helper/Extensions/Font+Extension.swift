//
//  Font+Extension.swift
//  TamagochiApp
//
//  Created by Carki on 2023/03/11.
//

import SwiftUI

extension Font {
    enum NotoSansCJKkr {
        case bold
        case regular
        case medium
        
        var value: String {
            switch self {
            case .bold:
                return "NotoSansCJKkr-Bold"
            case .medium:
                return "NotoSansCJKkr-Medium"
            case .regular:
                return "NotoSansCJKkr-Regular"
            }
        }
    }
    static func h4() -> Font{
        return .custom(NotoSansCJKkr.bold.value, size: 34)
    }
    static func h5() -> Font{
        return .custom(NotoSansCJKkr.bold.value, size: 24)
    }
    static func h6() -> Font{
        return .custom(NotoSansCJKkr.bold.value, size: 20)
    }
    static func body1() -> Font{
        return .custom(NotoSansCJKkr.bold.value, size: 16)
    }
    static func body2() -> Font{
        return .custom(NotoSansCJKkr.medium.value, size: 15)
    }
    static func button() -> Font{
        return .custom(NotoSansCJKkr.regular.value, size: 15)
    }
    static func caption() -> Font{
        return .custom(NotoSansCJKkr.regular.value, size: 13)
    }
}
