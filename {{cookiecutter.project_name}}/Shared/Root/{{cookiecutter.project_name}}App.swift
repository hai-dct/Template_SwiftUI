//
//  {{cookiecutter.project_name}}App.swift
//  {{cookiecutter.project_name}}
//
//  Created by {{cookiecutter.lead_dev_name}} on {% now 'local' %}.
//  Copyright © {% now 'local', '%Y' %} {{cookiecutter.company_name}} All rights reserved.
//

import SwiftUI
import os

@main
struct {{cookiecutter.project_name}}App: App {
    
    @AppStorage("AppState") var state: AppState = .login
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var settings = AppSettings()
    @StateObject private var notificationService = UserNotificationsService()
    
    /// Connect to AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    @ViewBuilder var rootView: some View {
        if state == .login {
            LoginView(viewModel: .init())
        } else {
            SettingsView(viewModel: .init())
        }
    }

    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(settings)
                .onAppear(perform: setups)
                .onRotate { orientation in
                    print(orientation.isLandscape)
                }
        }
        .onChange(of: scenePhase) { phase in
            print("App State : ", phase)
        }
    }
}

extension {{cookiecutter.project_name}}App {
    
    private func setups() {
        configNotificationServices()
    }

    private func configNotificationServices() {
        notificationService.requestAuthorization { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.registerForRemoteNotifications()
                case .failure(let error):
                    Console.log(error.localizedDescription, category: .notification)
                }
            }
        }
    }
    
    private func registerForRemoteNotifications() {
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    private func unregisterForRemoteNotifications() {
        UIApplication.shared.unregisterForRemoteNotifications()
    }
}

enum AppState: Int {
    case login
    case settings
}
