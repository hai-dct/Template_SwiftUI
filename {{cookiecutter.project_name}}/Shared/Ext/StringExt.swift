//
//  StringExt.swift
//  {{cookiecutter.project_name}}
//
//  Created by {{cookiecutter.lead_dev_name}} on {% now 'local' %}.
//  Copyright © {% now 'local', '%Y' %} {{cookiecutter.company_name}} All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        let language = Session.shared.language.value
        guard let bundle = Bundle.main.path(forResource: language, ofType: "lproj"),
            let langBundle = Bundle(path: bundle) else {
                return NSLocalizedString(self, comment: "")
        }
        return NSLocalizedString(self, bundle: langBundle, comment: "")
    }
}
