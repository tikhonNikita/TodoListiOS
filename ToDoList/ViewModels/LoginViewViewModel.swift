//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import Foundation
import FirebaseAuth

extension LoginView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var email = ""
        @Published var password = ""
        @Published var errorMessage = ""
        
        init() {}
        
        func login() {
            
            guard validate() else {
                return
            }
            
            Auth.auth().signIn(withEmail: email, password: password)
            
            
            
        }
        
        func validate() -> Bool {
            errorMessage = ""
            guard isNotEmpty(email),
                  isNotEmpty(password) else {
                errorMessage = "Please fill in all fields"
                return false
            }
            
            guard validateEmail(email) else {
                errorMessage = "Invalid email"
                return false
            }
            
            return true
            
        }
    }
    
}
//MVVM
//ASYNC
