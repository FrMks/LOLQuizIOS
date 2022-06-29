//
//  Main.swift
//  LOLQuiz
//
//  Created by Максим Французов on 21.06.2022.
//

import SwiftUI

struct Main: View {
    var model: Model
    var gameViewModel: GameViewModel
    var body: some View {
        Button(action: {
            print("Buttom play")
            model.screen = .firstGameScreen
            gameViewModel.parseJSON()
            
        }) {
            Text("Play")
                .bold()
                .font(.system(size: 23))
                .foregroundColor(.white)
                .padding()
                .frame(width: 330)
                .background(Color(red: 85/255, green: 52/255, blue: 165/255))
                .cornerRadius(10)
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main(model: Model(), gameViewModel: GameViewModel())
    }
}
