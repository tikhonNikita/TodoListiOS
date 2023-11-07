//
//  TodoListItemsView.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodoListView: View {
    @StateObject var vm: ViewModel
    @FirestoreQuery var items: [TodoListItem]

    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath:
        "users/\(userId)/todos"
        )
        self._vm = StateObject(wrappedValue: ViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .listStyle(PlainListStyle())
                            .swipeActions {
                                Button {
                                    vm.delete(id: item.id)
                                } label: {
                                    Text("Delete")
                                        .foregroundStyle(.red)
                                }
                                .tint(.red)
                            }
                }
                
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
    TodoListView(userId: "aY45AdrXs0PngOEr6Qo7uyWlWqk1")
}
