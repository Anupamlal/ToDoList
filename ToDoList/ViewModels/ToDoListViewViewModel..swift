//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    
    @Published var isNewItemViewPresent = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func deleteItem(id: String) {
        
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).collection("todos").document(id).delete()
    }
}
