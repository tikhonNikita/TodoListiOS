//
//  LoginView.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State private var showRegister = false

    
    var body: some View {
        NavigationStack {
            VStack {
                //Header
                HeaderView()
                //LoginForm
                Form {
                    TextField("Email Address", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Email Address", text: $email).textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        
                    }
                    label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                            Text("Log In")
                                .foregroundStyle(.white)
                                .bold()
                        }
                    }
                    .padding()
                }
                
                //Create account
                VStack {
                    Text("New around here?")
                    Button("Create An Account") {
                        showRegister = true
                    }
                }
                
                Spacer()
                    .navigationDestination(isPresented: $showRegister) {
                            RegisterView()
                        }
            }
        }
    }
}

#Preview {
    LoginView()
}
