//
//  Strings.swift
//  {{cookiecutter.project_name}}
//
//  Created by {{cookiecutter.lead_dev_name}} on {% now 'local' %}.
//  Copyright © {% now 'local', '%Y' %} {{cookiecutter.company_name}} All rights reserved.
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
