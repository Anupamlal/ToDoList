//
//  MainView.swift
//  ToDoList
//
//  Created by Anupam Lal on 15/03/24.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    
    @StateObject var mainViewModel = MainViewViewModel()
    
    var body: some View {
        
        if mainViewModel.isSignedIn() && mainViewModel.currentUserId != nil {
            accountView
        }else {
            LoginView()
        }
       
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: mainViewModel.currentUserId!)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .tint(.pink)
        .onAppear(perform: {
            UITabBar.appearance().backgroundColor = .systemGroupedBackground
        })
        
    }
}

#Preview {
    MainView()
}
