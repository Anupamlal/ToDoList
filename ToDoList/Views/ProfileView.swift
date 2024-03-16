//
//  ProfileView.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var profileViewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                if let userDetails = profileViewModel.loggedInUserDetails {
                    ProfileDisplayView(user: userDetails) {
                        print("Lgout called")
                        profileViewModel.logoutAction()
                    }
                    
                }else {
                    Text("Loading profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear(perform: {
            profileViewModel.fetchUserDetails {
            }
        })
    }
        
}

struct ProfileDisplayView: View {
    
    private let user:User
    var logoutAction:()->Void
    
    init(user: User, logoutAction: @escaping () -> Void) {
        self.user = user
        self.logoutAction = logoutAction
    }
    
    var body: some View {
        Image(systemName: "person.crop.circle")
            .renderingMode(.template)
            .resizable()
            .foregroundColor(.pink)
            .frame(width: 100, height: 100)
            .padding(.bottom, 50)
             
        ProfileRowView(rowName: "Name", rowValue: user.name)
        ProfileRowView(rowName: "email", rowValue: user.email)
        ProfileRowView(rowName: "Joined Since", rowValue: "\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
        
        TLButton(title: "Logout", backgroundColor: .pink) {
            logoutAction()
        }
        .padding(.leading, 28)
        .padding(.trailing, 28)
        Spacer()
    }
}

struct ProfileRowView :View {
    
    var rowName = ""
    var rowValue = ""
    
    var body: some View {
        HStack {
            Text(rowName)
                .padding(.leading, 30)
            
            Spacer()
            Text(rowValue)
                .padding(.trailing, 30)
        }
        .padding(.bottom, 15)
    }
}

#Preview {
    ProfileView()
}
