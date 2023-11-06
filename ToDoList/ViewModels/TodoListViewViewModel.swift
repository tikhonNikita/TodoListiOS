//
//  TodoListViewViewModel.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import Foundation

extension TodoListView {
    @MainActor class ViewModel : ObservableObject {
        @Published var showingNewItemView = false
        
    }
}



