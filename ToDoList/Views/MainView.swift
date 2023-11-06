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
            if vm.isSignedIn, !vm.currentUserId.isEmpty {
                accountView
            } else {
                LoginView()
            }

    }
    
   @ViewBuilder
   private var accountView: some View {
        TabView {
            TodoListView(userId: vm.currentUserId).tabItem { Label("Home", systemImage: "house") }
            ProfileView().tabItem { Label("Profile", systemImage: "person.circle") }
        }
    }
}

#Preview {
    MainView()
}
