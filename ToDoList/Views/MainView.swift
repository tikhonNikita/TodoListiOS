//
//  ContentView.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationView {
            if vm.isSignedIn, !vm.currentUserId.isEmpty {
                TodoListView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}
