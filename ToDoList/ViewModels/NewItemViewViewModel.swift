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
            
            let db = Firestore.firestore()
            let ref = db.collection("users")
                .document(uId)
                .collection("todos")
                .document()
            
            let newID = ref.documentID
            // get current userID
            
            let newItem = TodoListItem(
                id: newID, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false
            )
            
          
            ref.setData(newItem.asDictionary())
            
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
