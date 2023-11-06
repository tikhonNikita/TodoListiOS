//
//  TodoListItem.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
    
}
