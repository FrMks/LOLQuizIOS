//
//  ContentView.swift
//  LOLQuiz
//
//  Created by Максим Французов on 20.06.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = Model()
    @ObservedObject var gameViewModel = GameViewModel()
    var body: some View {
        switch model.screen {
        case .createScreen:
            CreateAccount(model: self.model)
        case .loginScreen:
            LoginAccount(model: self.model)
        case .mainScreen:
            Main(model: self.model, gameViewModel: self.gameViewModel)
        case .firstGameScreen:
            FirstGame(model: self.model, gameViewModel: self.gameViewModel)
        }
        
//        if !model.loginAccount {
//            CreateAccount()
//        } else if model.main {
//            Main()
//        } else if model.loginAccount {
//            LoginAccount()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
