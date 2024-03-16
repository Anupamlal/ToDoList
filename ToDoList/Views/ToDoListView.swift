//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var toDoListViewModel: ToDoListViewViewModel
    @FirestoreQuery var items:[ToDoItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._toDoListViewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(toDoItem: item)
                        .swipeActions {
                            Button("Delete") {
                                toDoListViewModel.deleteItem(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(.plain)
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    toDoListViewModel.isNewItemViewPresent = true
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 17.5, style: .circular)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.pink)
                        
                        Image(systemName: "plus")
                            .tint(Color.white)
                            .bold()
                    }
                }
            }
            .sheet(isPresented: $toDoListViewModel.isNewItemViewPresent, content: {
                NewItemView(newItemPresented: $toDoListViewModel.isNewItemViewPresent)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "OlZFD3LeYvap8n6S1PZwgOKJOQx2")
}
