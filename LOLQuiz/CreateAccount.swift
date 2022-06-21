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
                        .frame(width: 150, height: 150)
                    
                    Image("AccountIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                }
                
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                            .foregroundColor(Color(red: 168/255, green: 92/255, blue: 249/255))
                        .opacity(0.7)
                        
                        Image("Email_SVG")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }
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
