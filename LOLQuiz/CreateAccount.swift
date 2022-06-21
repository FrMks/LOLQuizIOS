//
//  CreateAccount.swift
//  LOLQuiz
//
//  Created by Максим Французов on 20.06.2022.
//

import SwiftUI

struct CreateAccount: View {
    @State var emailIsEmpty = true
    @ObservedObject var varCreateAccount = VarCreateAccount()
    @ObservedObject var model = Model()
    var body: some View {
        ZStack {
            Image("CreateAccount")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.7)
                
            VStack {
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
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        }
                            
                        ZStack {
                            if varCreateAccount.email.isEmpty {
                                Text("Email")
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(width: 250, height: 50, alignment: .leading)
                            }
                            
                            TextField("", text: $varCreateAccount.email)
                                    .padding()
                                    .frame(width: 250, height: 50)
                                    .foregroundColor(.white)
                                    .background(Color(red: 75/255, green: 123/255, blue: 229/255).opacity(0.7))
                                    .cornerRadius(10)
                        }.padding()
                    }
                    
                    
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                                .foregroundColor(Color(red: 168/255, green: 92/255, blue: 249/255))
                            .opacity(0.7)
                            
                            Image("Password_SVG")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        }
                            
                        ZStack {
                            if varCreateAccount.email.isEmpty {
                                Text("Password")
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(width: 250, height: 50, alignment: .leading)
                            }
                            
                            TextField("", text: $varCreateAccount.password)
                                    .padding()
                                    .frame(width: 250, height: 50)
                                    .foregroundColor(.white)
                                    .background(Color(red: 75/255, green: 123/255, blue: 229/255).opacity(0.7))
                                    .cornerRadius(10)
                        }.padding()
                    }
                    
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                                .foregroundColor(Color(red: 168/255, green: 92/255, blue: 249/255))
                            .opacity(0.7)
                            
                            Image("Password_SVG")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        }
                            
                        ZStack {
                            if varCreateAccount.email.isEmpty {
                                Text("Confirm password")
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(width: 250, height: 50, alignment: .leading)
                            }
                            
                            TextField("", text: $varCreateAccount.againPassword)
                                    .padding()
                                    .frame(width: 250, height: 50)
                                    .foregroundColor(.white)
                                    .background(Color(red: 75/255, green: 123/255, blue: 229/255).opacity(0.7))
                                    .cornerRadius(10)
                        }.padding()
                    }
                    Button(action: {
                        if !varCreateAccount.email.isEmpty && !varCreateAccount.password.isEmpty && varCreateAccount.againPassword == varCreateAccount.password {
                            model.main = true
                        }
                    }) {
                        Text("CREATE ACCOUNT")
                            .bold()
                            .font(.system(size: 23))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 330)
                            .background(Color(red: 85/255, green: 52/255, blue: 165/255))
                            .cornerRadius(10)
                    }
                }.padding()
                HStack {
                    Text("Already have a account?").foregroundColor(.white)
                    Text("Login").foregroundColor(Color(red: 111/255, green: 223/255, blue: 223/255)).onTapGesture {
                        model.loginAccount = true
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
