//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
        
    @Published var newItemTitle = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {
        
    }
    
    func save() {
        
        guard canSave else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let id = UUID().uuidString
        
        let newToDoItem = ToDoItem(id: id, title: newItemTitle, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        guard let newToDoDict = newToDoItem.asDictionary() else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(uId).collection("todos").document(id).setData(newToDoDict) { error in
            
        }
        
    }
    
    var canSave: Bool {
        guard !newItemTitle.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
