//
//  SwiftUITemplateApp.swift
//  Shared
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 5/25/21.
//

import SwiftUI


// MARK: - Base color
struct BaseColor {
    /// dynamic color sets (with dark and light mode)
    let backgroundPrimary = Color("backgroundPrimary")
    let textPrimary = Color("textPrimary")
    let themePrimary = Color("themePrimary")
    
    struct Toast {
        let text = Color("toastText")
        let background = Color("toastBackground")
    }
}

struct TokenColor {
    let baseColor = BaseColor()
    
    let inactive: Color!
    
    let textDefault: Color!
    
    let buttonTheme: Color!
    
    let backgroundDefault: Color!
    let toast = BaseColor.Toast()
    
    init() {
        self.buttonTheme = baseColor.themePrimary
        self.textDefault = baseColor.textPrimary
        self.backgroundDefault = baseColor.backgroundPrimary
        self.inactive = .gray
    }
}

// MARK: - Add palatte to Color struct
extension Color {
    static let Token = TokenColor()
}
