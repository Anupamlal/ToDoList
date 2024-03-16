//
//  User.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let name: String
    let joined: TimeInterval
}
