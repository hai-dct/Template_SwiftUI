//
//  StringExt.swift
//  Shared
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 5/3/21.
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
