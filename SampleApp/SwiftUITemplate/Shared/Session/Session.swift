//
//  Session.swift
//  SwiftUITemplate
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 5/26/21.
//

import Foundation

enum Language: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }

    case english = "English"
    case vietnamese = "Vietnamese"
    
    var value: String {
        switch self {
        case .english:
            return "en"
        case .vietnamese:
            return "vi"
        }
    }
}

final class Session {
    
    static let shared = Session()
    
    private init() { }
    
    var language: Language {
        get {
            if let value = UserDefaults.standard.string(forKey: "language"),
               let lg = Language(rawValue: value) {
                return lg
            } else {
                return .english
            }
        } set {
            UserDefaults.standard.setValue(newValue.rawValue, forKey: "language")
        }
    }
}
