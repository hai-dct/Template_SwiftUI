//
//  Typography.swift
//  swiftui-design-system-demo
//
//  Created by 邵名浦 on 2019/9/3.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import SwiftUI

///
// MARK: - Base typography materials
///
struct TokenTypography {
    
    /// Setting size
    enum FontSize: CGFloat {
        case small = 12, medium = 20, large = 28
    }
    
    /// Setting font
    enum FontFamily: String {
        case hiraginoSans = "HiraginoSans",
             georgia = "Georgia"
    }
    
    enum FontStyle: String {
        case regular,
             bold,
             italic,
             underline,
             strikeout,
             w3,
             w6
    }
}

/// Helper functions
extension TokenTypography {
    
    public func sizingFont(font: FontFamily, style: FontStyle = .regular, size: FontSize) -> Font {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size.rawValue)
        let fontName = font.rawValue + "-" + style.rawValue.capitalizingFirstLetter()
        return Font.custom(fontName, size: scaledSize)
    }
}

///
// MARK: - Expose Typography to Font struct
///
extension Font {

    static let Typography = TokenTypography()
}

extension String {

    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
