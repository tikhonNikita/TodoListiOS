//
//  RegisterView.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var vm = ViewModel()
    
    var body: some View {
            VStack {
                //Header
                HeaderView(
                    title: "Register",
                    subtitle: "Start organizing you todos",
                    rotationAngle: -15,
                    color: .orange
                )

                Form {
                    TextField("Full name", text: $vm.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Email Address", text: $vm.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $vm.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "Create account", background: .green) {
                        vm.register()
                    }
                }
                Spacer()
                //LoginForm
                
                //Create account
            }
    }
}

#Preview {
    RegisterView()
}
