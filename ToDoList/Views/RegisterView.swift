//
//  RegisterView.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var registerViewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            
            //Header
            LoginOrRegisterHeaderView(firstText: "Register", secondText: "Start organizing todos", isForRegisterFlow: true)
            
            //Form
            Form {
                
                if !registerViewModel.errorMsg.isEmpty {
                    Text(registerViewModel.errorMsg)
                        .foregroundColor(.red)
                }
                
                TextField("Your Name", text: $registerViewModel.registerUsername)
                    .autocorrectionDisabled()
                
                TextField("Your Email", text: $registerViewModel.registerEmail)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .submitLabel(.done)
                
                SecureField("Create Password", text: $registerViewModel.registerPassword)
                
                TLButton(
                    title: "Create Account",
                    backgroundColor: .green
                ) {
                    registerViewModel.signUp()
                }
            }
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
