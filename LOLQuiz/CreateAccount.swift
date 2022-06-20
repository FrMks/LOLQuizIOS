//
//  CreateAccount.swift
//  LOLQuiz
//
//  Created by Максим Французов on 20.06.2022.
//

import SwiftUI

struct CreateAccount: View {
    var body: some View {
        ZStack {
            Image("CreateAccount")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.7)
                
            VStack {
                Text("Create Account")
                    .foregroundColor(.white)
                    .font(.system(size: 32))
                    .bold()
                
                ZStack {
                    Circle()
                        .opacity(0.7)
                        .foregroundColor(Color(red: 75/255, green: 123/255, blue: 229/255))
                        .frame(width: 200, height: 200)
                    
                    Image("AccountIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
            }
        }
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount()
    }
}
