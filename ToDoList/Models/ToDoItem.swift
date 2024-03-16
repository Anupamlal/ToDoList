//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import Foundation

struct ToDoItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        self.isDone = state
    }
    
    
}
