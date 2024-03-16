//
//  Helper.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import SwiftUI

let SCREEN_SIZE = UIScreen.main.bounds

class Helper {
    
    class func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    class func convertToData(json: [String: Any]) -> Data? {
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else {
            return nil
        }
            
        return jsonData
    }
}
