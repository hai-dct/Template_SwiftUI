//
//  LoginViewModel.swift
//  Shared
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 5/26/21.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var userName: String = ""
    @Published var password: String = ""
}
