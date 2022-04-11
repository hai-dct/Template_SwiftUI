//
//  SettingsViewModel.swift
//  SwiftUITemplate
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 5/29/21.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {

    @Published var previewIndex = 0
    let previewOptions = ["Now", "5 seconds", "10 seconds"]
}
