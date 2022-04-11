//
//  TokenColor.swift
//  {{cookiecutter.project_name}}
//
//  Created by {{cookiecutter.lead_dev_name}} on {% now 'local' %}.
//  Copyright © {% now 'local', '%Y' %} {{cookiecutter.company_name}} All rights reserved.
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
