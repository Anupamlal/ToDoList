//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject {
        
    init() {
        
    }
    
    func toggle(item: ToDoItem) {
        var copyItem = item
        copyItem.setDone(!copyItem.isDone)
        
        guard let userID = Auth.auth().currentUser?.uid, let copyItemDict = copyItem.asDictionary() else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(userID).collection("todos").document(copyItem.id).setData(copyItemDict)
    }
}
