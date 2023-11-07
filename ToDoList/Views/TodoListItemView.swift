//
//  TodoListItemView.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import SwiftUI

struct TodoListItemView: View {
    let item: TodoListItem
    @StateObject var vm = ViewModel()
    
    
    var body: some View {
        HStack {
            VStack {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            Button {
                vm.toggleTodo(for: item)
            } label: {
                Image(systemName: item.isDone ? "circle.badge.checkmark.fill" : "pawprint.circle.fill")
                    .foregroundColor(item.isDone ? .green : .blue)
            }
        }
    }
}

#Preview {
    TodoListItemView(item: TodoListItem(id: "Test", title: "Nikita Item", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
