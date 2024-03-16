//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    
    @Published var registerEmail:String = ""
    @Published var registerPassword:String = ""
    @Published var registerUsername:String = ""
    @Published var errorMsg:String = ""
    
    init() {
        
    }
    
    func signUp() {
        
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: registerEmail, password: registerPassword) {[weak self] (result, error) in
            guard let weakSelf = self else {
                return
            }
            
            guard let userId = result?.user.uid else {
                weakSelf.errorMsg = "Unable to create an account"
                return
            }
            
            weakSelf.insertUserRecord(userId: userId)
        }
    }
    
    private func validate() -> Bool {
        
        errorMsg = ""
        
        guard !registerEmail.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !registerPassword.trimmingCharacters(in: .whitespaces).isEmpty && !registerUsername.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg = "Please enter credentials"
            return false
        }
        
        guard Helper.isValidEmail(registerEmail) else {
            errorMsg = "Please enter correct email"
            return false
        }
        
        guard registerPassword.count >= 6 else {
            errorMsg = "Password should be atleast 6 chars"
            return false
        }
        return true
    }
    
    private func insertUserRecord(userId: String) {
        
        let newUser = User(id: userId, email: registerEmail, name: registerUsername, joined: Date().timeIntervalSince1970)
        
        guard let newUserDict = newUser.asDictionary() else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).setData(newUserDict)
    }
}
