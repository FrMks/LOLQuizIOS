//
//  LoginAccount.swift
//  LOLQuiz
//
//  Created by Максим Французов on 21.06.2022.
//

import SwiftUI

struct LoginAccount: View {
    @ObservedObject var varCreateAccount = VarCreateAccount()
    var model: Model
    var body: some View {
        ZStack {
            Image("CreateAccount")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.7)
            
            VStack {
                Text("Login Account")
                    .foregroundColor(.white)
                    .font(.system(size: 32))
                    .bold()
                
                IconAccount()
                
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
                    TextField("", text: $varCreateAccount.email, onEditingChanged: { (isChanged) in
                        if !isChanged {
                            if self.textFieldValidatorEmail(varCreateAccount.email) {
                                varCreateAccount.isEmailValid = true
                                        } else {
                                            varCreateAccount.isEmailValid = false
                                            varCreateAccount.email = ""
                                        }
                                    }
                    })
                        .padding()
                        .frame(width: 250, height: 50)
                        .foregroundColor(.white)
                        .background(Color(red: 75/255, green: 123/255, blue: 229/255).opacity(0.7))
                        .cornerRadius(10)
                        .placeholder(when: varCreateAccount.email.isEmpty) {
                            Text("Email").foregroundColor(.white).padding()
                        }
                        .padding()
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
                    TextField("", text: $varCreateAccount.password)
                        .padding()
                        .frame(width: 250, height: 50)
                        .foregroundColor(.white)
                        .background(Color(red: 75/255, green: 123/255, blue: 229/255).opacity(0.7))
                        .cornerRadius(10)
                        .placeholder(when: varCreateAccount.email.isEmpty) {
                            Text("Password").foregroundColor(.white).padding()
                        }
                        .padding()
                }
                
                Button(action: {
                    if !varCreateAccount.email.isEmpty && !varCreateAccount.password.isEmpty {
                        print("main = true")
                        model.screen = .mainScreen
                    }
                }) {
                    Text("Login")
                        .bold()
                        .font(.system(size: 23))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 330)
                        .background(Color(red: 85/255, green: 52/255, blue: 165/255))
                        .cornerRadius(10)
                }
                
                HStack {
                    Text("Don't have an account?").foregroundColor(.white)
                    Text("Sign up").foregroundColor(Color(red: 111/255, green: 223/255, blue: 223/255)).onTapGesture {
                        print("sign up = true")
                        model.screen = .createScreen
                    }
                }
            }
        }
    }
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
}

struct LoginAccount_Previews: PreviewProvider {
    static var previews: some View {
        LoginAccount(model: Model())
    }
}
