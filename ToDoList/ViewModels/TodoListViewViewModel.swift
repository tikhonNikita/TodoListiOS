//
//  TodoListViewViewModel.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import Foundation
import FirebaseFirestore

extension TodoListView {
    @MainActor class ViewModel : ObservableObject {
        @Published var showingNewItemView = false
        private let userId: String
        init(userId: String) {
            self.userId = userId
        }
        
    
        func delete(id: String) {
            let db = Firestore.firestore()
            print("ID: \(id)")
            print("UserID: \(userId)")
            db.collection("users")
                .document(userId)
                .collection("todos")
                .document(id)
                .delete()
        }
        
    }
}



