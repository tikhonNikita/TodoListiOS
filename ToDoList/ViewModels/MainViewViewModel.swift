//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import Foundation
import FirebaseAuth

extension MainView {
    @MainActor class ViewModel: ObservableObject {
        @Published var currentUserId: String = ""
        private var handler: AuthStateDidChangeListenerHandle? = nil
        
        init() {
            self.handler = Auth.auth().addStateDidChangeListener {
                [weak self] _, user in self?.updateID(id: user?.uid ?? "")
            }
        }
        
        public var isSignedIn: Bool {
            return Auth.auth().currentUser != nil
        }
        
        private func updateID(id: String) {
            self.currentUserId = id
        }
    }
}
