//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

extension ProfileView {
    @MainActor class ViewModel : ObservableObject {
        @Published var user: User? = nil
        
        
        func fetchUser() async {
            guard let userId = Auth.auth().currentUser?.uid else {
                return
            }
            do {
                
                let userSnapshot = try await Firestore.firestore()
                    .collection("users")
                    .document(userId).getDocument()
                
                guard let userData = userSnapshot.data() else {
                    return
                }
                
                self.user = User(
                    id: userData["id"] as? String ?? "",
                    name: userData["name"] as? String ?? "",
                    email: userData["email"] as? String ?? "",
                    joined: userData["joined"] as? TimeInterval ?? 0
                )
                
            } catch {
             print("Error: \(error)")
            }

        }
        
        func logout() {
            do {
                try Auth.auth().signOut()
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
