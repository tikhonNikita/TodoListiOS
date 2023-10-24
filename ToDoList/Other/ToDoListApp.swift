//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import SwiftUI
import FirebaseCore
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseAnalytics // <-- Import this

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
        Analytics.logEvent("App Started", parameters: nil)
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
