//
//  AppSettings.swift
//  {{cookiecutter.project_name}}
//
//  Created by {{cookiecutter.lead_dev_name}} on {% now 'local' %}.
//  Copyright © {% now 'local', '%Y' %} {{cookiecutter.company_name}} All rights reserved.
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
