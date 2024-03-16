//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Anupam Lal on 15/03/24.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
