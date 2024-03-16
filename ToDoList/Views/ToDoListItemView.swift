//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @StateObject var toDoListItemViewModel = ToDoListItemViewViewModel()
    
    let toDoItem: ToDoItem
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                Text(toDoItem.title)
                    .font(.title2)
                Text("\(Date(timeIntervalSince1970: toDoItem.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
            }
            
            Spacer()
            
            Button(action: {
                toDoListItemViewModel.toggle(item: toDoItem)
                
            }, label: {
                Image(systemName: toDoItem.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.pink)
            })
        }
    }
}

#Preview {
    ToDoListItemView(toDoItem: ToDoItem(id: "sss", title: "Minti's bday bash", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
