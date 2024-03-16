//
//  Extensions.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import Foundation

extension Encodable {
    
    func asDictionary() -> [String:Any]? {
        
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        guard let jsonData = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return nil
        }
            
        return jsonData
    }
}
