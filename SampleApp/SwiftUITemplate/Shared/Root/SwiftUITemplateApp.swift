//
//  SwiftUITemplateApp.swift
//  Shared
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 5/25/21.
//

import SwiftUI
import os

@main
struct SwiftUITemplateApp: App {
    
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

extension SwiftUITemplateApp {
    
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
