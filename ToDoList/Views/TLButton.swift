//
//  TLButton.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import SwiftUI

struct TLButton: View {
    let title:String
    let backgroundColor:Color
    let action:()->Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .frame(height: 40)
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
}

#Preview {
    TLButton(title: "", backgroundColor: .blue) {
        
    }
}
