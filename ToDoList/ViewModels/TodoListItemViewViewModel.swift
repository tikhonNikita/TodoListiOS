//
//  TodoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

extension TodoListItemView {
    @MainActor class ViewModel : ObservableObject {
     
        func toggleTodo(for item: TodoListItem) {
            var itemCopy = item
            itemCopy.setDone(!item.isDone)
            
            guard let uid = Auth.auth().currentUser?.uid else {
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(uid)
                .collection("todos")
                .document(item.id)
                .setData(itemCopy.asDictionary())
            
        }
    }
}
