//
//  ProfileView.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationView {
            if let user = vm.user {
                VStack(alignment: .center) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 125, height: 125)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name:")
                                .bold()
                            Text(user.name)
                        }
                        HStack {
                            Text("email:")
                                .bold()
                            Text(user.email)
                        }
                        HStack {
                            Text("Member Since:")
                                .bold()
                            Text(Date(timeIntervalSince1970: user.joined).formatted(
                                date: .abbreviated, time: .shortened))
                        }
                    }
                    .padding()
                    
                    Button("Log out") {
                        vm.logout()
                    }.tint(.red)
                        .padding()
                }
                .navigationTitle("Profile")
            } else {
                ProgressView()
                    .navigationTitle("Profile")
            }
        }.onAppear {
            Task {
               await vm.fetchUser()
            }
        }
    }
}

#Preview {
    ProfileView()
}
