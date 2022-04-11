//
//  Strings.swift
//  Shared
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 5/3/21.
//

import Foundation

struct Strings {
    struct Settings {
        static var title: String { "settings.title".localized }
        static var profile: String { "settings.profile".localized }
        static var language: String { "settings.language".localized }
        static var notifications: String { "settings.notifications".localized }
        static var aboout: String { "settings.about".localized }
        static var version: String { "settings.version".localized }
        static var logout: String { "settings.logout".localized }
    }

    struct Login {
        static var title: String { "login.title".localized }
        static var username: String { "login.username".localized }
        static var password: String { "login.password".localized }
        static var login: String { "login.login".localized }
    }
}
