//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Anupam Lal on 15/03/24.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    
    @Published var currentUserId: String? = nil
    @Published var handler: AuthStateDidChangeListenerHandle? = nil
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener({ [weak self] _, user in
            
            guard let user = user else {
                self?.currentUserId = nil
                return
            }
            
            DispatchQueue.main.async {
                self?.currentUserId = user.uid
            }
        })
    }
    
    public func isSignedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
}
