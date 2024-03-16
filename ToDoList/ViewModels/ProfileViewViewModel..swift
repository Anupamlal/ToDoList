//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    
    @Published var loggedInUserDetails:User? = nil
    
    init() {
    }
    
    func fetchUserDetails(completion: @escaping()->Void) {
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(uId).getDocument { [weak self] (snapShot, error) in
            
            guard let userSnapShotJson = snapShot?.data(), error == nil else {
                return
            }
            
            guard let userData = Helper.convertToData(json: userSnapShotJson) else {
                return
            }
            
            guard let userInfo = try? JSONDecoder().decode(User.self, from: userData) else {
                return
            }
            
            self?.loggedInUserDetails = userInfo
            
            completion()
        }
    }
    
    func logoutAction() {
        
        print("logut pressed")
        
        do {
            try Auth.auth().signOut()
            
        }catch {
            print("logout failed")
        }
    }
}
