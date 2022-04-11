//
//  LoginView.swift
//  Shared
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 5/26/21.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel
    @State var isPrivate: Bool = true
    @State var isLoadingShowing: Bool = false
    @AppStorage("AppState") var state: AppState = .login
    
    var body: some View {
        Form {
            Section(
                header: Text(Strings.Login.title).myFont(.title)
                    .padding()
            ) {
                TextField(Strings.Login.username, text: $viewModel.userName)
                    .textContentType(.username)
                    .myFont(.body)
                Toggle(isOn: $isPrivate) {
                    if isPrivate {
                        SecureField(Strings.Login.password, text: $viewModel.password)
                            .textContentType(.password)
                    } else {
                        TextField(Strings.Login.password, text: $viewModel.password)
                            .textContentType(.password)
                    }
                }
                .myFont(.body)
            }
            Button(
                action: {
                    withAnimation {
                        isLoadingShowing = true
                    }
                }, label: {
                    Text(Strings.Login.login)
                        .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
                .myFont(.title)
        }
        .padding([.top, .bottom], 100)
        .background(Color(#colorLiteral(red: 0.9489265084, green: 0.949085772, blue: 0.9704096913, alpha: 1)))
        .loading(isShowing: $isLoadingShowing) {
            state = .settings
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: .init())
    }
}
