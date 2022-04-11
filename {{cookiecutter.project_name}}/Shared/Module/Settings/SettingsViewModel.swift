//
//  SettingsViewModel.swift
//  {{cookiecutter.project_name}}
//
//  Created by {{cookiecutter.lead_dev_name}} on {% now 'local' %}.
//  Copyright © {% now 'local', '%Y' %} {{cookiecutter.company_name}} All rights reserved.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {

    @Published var previewIndex = 0
    let previewOptions = ["Now", "5 seconds", "10 seconds"]
}
