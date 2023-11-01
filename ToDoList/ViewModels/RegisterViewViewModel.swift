//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

extension RegisterView {
    @MainActor class ViewModel: ObservableObject {
        @Published var name: String = ""
        @Published var email: String = ""
        @Published var password: String = ""
        
        
        func register() {
            guard validate() else {
                return
            }
            
            Auth.auth().createUser(withEmail: email, password: password) {
                [weak self] result, error in
                guard let user = result?.user.uid else {
                    return
                }
                
                self?.insertUserId(userId: user)
                
                
            }
        }
        
        func validate() -> Bool {
            guard isNotEmpty(name), isNotEmpty(password), isNotEmpty(email) else {
                return false
            }
            
            guard validateEmail(email) else {
                return false
            }
            
            guard password.count >= 6 else {
                return false
            }
            
            return true
            
        }
        
        func insertUserId(userId: String) {
            let newUser = User(id: userId, name: name, email: email, joined: Date().timeIntervalSince1970)
            
            let db = Firestore.firestore()
            db.collection("users").document(userId)
                .setData(newUser.asDictionary())
        }
        
    }
}
