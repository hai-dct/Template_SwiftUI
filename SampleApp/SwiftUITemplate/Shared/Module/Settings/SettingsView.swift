//
//  SettingsView.swift
//  Shared
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 5/26/21.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("AppState") var state: AppState = .login
    @EnvironmentObject var settings: AppSettings
    @StateObject var viewModel: SettingsViewModel
    @State private var isToastShowing = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(Strings.Settings.profile)) {
                    Text("Username")
                        .foregroundColor(.gray)
                    
                    Picker(selection: $settings.language,
                           label: Text(Strings.Settings.language)) {
                        ForEach(Language.allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    }
                }
                
                Section(header: Text(Strings.Settings.notifications)) {
                    Picker(selection: $viewModel.previewIndex,
                           label: Text("Show")) {
                        ForEach(0 ..< viewModel.previewOptions.count) {
                            Text(viewModel.previewOptions[$0])
                        }
                    }
                    .onChange(of: viewModel.previewIndex) { value in
                        withAnimation {
                            isToastShowing = true
                        }
                        if value == 0 {
                            createNotification(time: 1)
                        } else if value == 1{
                            createNotification(time: 5)
                        } else {
                            createNotification(time: 10)
                        }
                    }
                }
                
                Section(header: Text(Strings.Settings.aboout)) {
                    HStack {
                        Text(Strings.Settings.version)
                        Spacer()
                        Text(settings.version)
                    }
                    Text(dateformater.string(from: Date()))
                }
                
                Section {
                    Button(action: {
                        state = .login
                    }) {
                        Text(Strings.Settings.logout)
                    }
                }
            }
            .navigationBarTitle(Strings.Settings.title)
            .toast(isShowing: $isToastShowing, text: .init("You have set notification push!"))
        }
    }
}

extension SettingsView {

    private func createNotification(time: Double) {
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.subtitle = "subtitle"
        content.body = "body"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
        let request = UNNotificationRequest.init(identifier: "localNotifications", content: content, trigger: trigger)

        UserNotificationsService.shared.add(request, then: nil)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: .init())
    }
}

var dateformater: DateFormatter {
    let df = DateFormatter()
    df.dateStyle = .short
    df.dateFormat = "MM/dd/yyyy"
    return df
}
