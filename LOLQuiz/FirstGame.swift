//
//  FirstGame.swift
//  LOLQuiz
//
//  Created by Максим Французов on 22.06.2022.
//

import SwiftUI

struct FirstGame: View {
    var model: Model
    @ObservedObject var gameViewModel: GameViewModel
    var body: some View {
        VStack {
            Button(action: {
                gameViewModel.generateRandomItems()
            }) {
                Text("Generate")
            }
            List(gameViewModel.randomItems) {
                Text($0.name)
            }
            
//            if randomItem1.id == randomItem2.id {
//                randomItem2 = gameViewModel.result.randomElement()!
//                Text(randomItem2.name)
//            } else {
//                Text(randomItem2.name)
//            }
            
//            if randomItem?[randomItem.id - 1] == resultCount || randomItem?[randomItem.id - 1] < resultCount {
//                let resultName =  gameViewModel.result[randomItem.id].name
//                Text(resultName)
//            } else {
//                Text("Error")
//            }
            
            
//            List(gameViewModel.result) {
//                Text($0.name)
//            }
        }
    }
}

struct FirstGame_Previews: PreviewProvider {
    static var previews: some View {
        FirstGame(model: Model(), gameViewModel: GameViewModel())
    }
}
