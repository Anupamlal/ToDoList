//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var errorMsg:String = ""
    
    init() {
        
    }
    
    func login() {
        
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] (result, error) in
            guard let weakSelf = self else {
                return
            }
            
            
        }
    }
    
    func validate() -> Bool {
        
        errorMsg = ""
        
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg = "Please enter credentials"
            return false
        }
        
        guard Helper.isValidEmail(email) else {
            errorMsg = "Please enter correct email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMsg = "Password should be atleast 6 chars"
            return false
        }
        return true
    }
    
    
}
