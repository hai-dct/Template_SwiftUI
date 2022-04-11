//
//  LoginViewModel.swift
//  {{cookiecutter.project_name}}
//
//  Created by {{cookiecutter.lead_dev_name}} on {% now 'local' %}.
//  Copyright © {% now 'local', '%Y' %} {{cookiecutter.company_name}} All rights reserved.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var userName: String = ""
    @Published var password: String = ""
}
