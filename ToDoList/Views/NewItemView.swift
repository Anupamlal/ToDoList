//
//  NewItemView.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var newItemViewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Spacer(minLength: 20)
            Text("New Item")
                .bold()
                .font(.system(size: 32))
            
            Form {
                
                // Title
                TextField("Title", text: $newItemViewModel.newItemTitle)
                    .submitLabel(.done)
                
                // Due date
                DatePicker("Due date", selection: $newItemViewModel.dueDate)
                    .datePickerStyle(.graphical)
                
                //Button
                TLButton(title: "Save", backgroundColor: .pink) {
                    
                    if newItemViewModel.canSave {
                        newItemPresented = false
                        newItemViewModel.save()
                        
                    }else {
                        newItemViewModel.showAlert = true
                    }
                }
                .alert(isPresented: $newItemViewModel.showAlert, content: {
                    Alert(title: Text("Error!"), message: Text("Please fill in all the fields"))
                })
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
