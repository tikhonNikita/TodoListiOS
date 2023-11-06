//
//  TodoListItemsView.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var vm = ViewModel()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    vm.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $vm.showingNewItemView, content: {
                NewItemView(showNewItemPresented: $vm.showingNewItemView)
            })
        }
    }
}

#Preview {
    TodoListView(userId: "test")
}
