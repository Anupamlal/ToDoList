//
//  LoginOrRegisterHeaderView.swift
//  ToDoList
//
//  Created by Anupam Lal on 16/03/24.
//

import SwiftUI

struct LoginOrRegisterHeaderView: View {
    var firstText = ""
    var secondText = ""
    var isForRegisterFlow = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(isForRegisterFlow ? Color.orange : Color.pink)
                .rotationEffect(Angle(degrees: isForRegisterFlow ? -15 : 15))
                
            
            VStack {
                Text(firstText)
                    .bold()
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                
                Text(secondText)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top, 30)
        }
        .frame(width: SCREEN_SIZE.width * 3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
    LoginOrRegisterHeaderView()
}
