//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

let secondsInDay = 86400

extension NewItemView {
    @MainActor class ViewModel : ObservableObject {
        @Published var title: String = ""
        @Published var dueDate = Date()
        @Published var showAlert = false
        
        func save() {
            guard canSave else {
                return
            }
            
            guard let uId = Auth.auth().currentUser?.uid else {
                return
            }
            
            // get current userID
            
            // create Model
            let newId = UUID().uuidString
            let newItem = TodoListItem(
                id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false
            )
            
            // save model
            let db = Firestore.firestore()
            db.collection("users")
                .document(uId)
                .collection("todos")
                .document()
                .setData(newItem.asDictionary())
            
            //
            
        }
        
        var canSave: Bool {
            guard isNotEmpty(title) else {
                return false
            }
            
            guard dueDate >= Date().addingTimeInterval(TimeInterval(secondsInDay)) else {
                return false
            }
            
            return true
        }
        
    }
}
