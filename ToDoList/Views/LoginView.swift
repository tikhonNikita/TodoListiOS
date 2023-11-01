//
//  LoginView.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import SwiftUI

//MVVM
//@StateObject
//@mainActor

struct LoginView: View {
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
            VStack {
                //Header
                HeaderView(
                    title: "To Do List",
                    subtitle: "Get things done",
                    rotationAngle: 15,
                    color: .pink
                )
                //LoginForm
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log in", background: .blue) {
                        viewModel.login()
                    }
                }
                
                //Create account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                
                Spacer()
        }
    }
}

#Preview {
    LoginView()
}

//https://www.vadimbulavin.com/how-to-move-swiftui-view-when-keyboard-covers-text-field/
