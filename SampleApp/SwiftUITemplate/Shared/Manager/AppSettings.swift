//
//  AppSettings.swift
//  SwiftUITemplate
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 4/28/21.
//

import SwiftUI

final class AppSettings: ObservableObject {

    @Published var language: Language {
        didSet {
            Session.shared.language = language
        }
    }

    var version: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    init() {
        language = Session.shared.language
    }
}
