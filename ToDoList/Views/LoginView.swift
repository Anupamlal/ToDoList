//
//  LoginView.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                //Header
                LoginOrRegisterHeaderView(firstText: "To Do List", secondText: "Get things done", isForRegisterFlow: false)
                    .padding(.top, 50)
                                
                //Form
                Form {
                    if !viewModel.errorMsg.isEmpty {
                        Text(viewModel.errorMsg)
                            .foregroundColor(.red)
                    }
                    TextField("Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                        .submitLabel(.done)
                    
                    SecureField("Password", text: $viewModel.password)
                    
                    TLButton(title: "Log In", backgroundColor: .blue) {
                        viewModel.login()
                    }
                }
                .scrollDisabled(true)
                .offset(y: -50)
                
                VStack {
                    Text("New around here ?")
                        .padding(.bottom, 5)
                    NavigationLink("Create an account") {
                        RegisterView()
                    }
                }
                .padding(.bottom, 30)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
