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
                //gameViewModel.generateRandomItems()
                gameViewModel.testGenerateRandomNainItem()
                gameViewModel.testGenerateRandomItems()
            }) {
                Text("Generate")
            }
            
            ForEach(gameViewModel.mainRandomItem) { item in
                AsyncImage(url: URL(string: item.imageUrl))
                    .frame(width: 70, height: 70)
                    .padding()
                    .background(Color(red: 75/255, green: 123/255, blue: 229/255))
                    .cornerRadius(10)
            }
            
//            ZStack {
//                Rectangle()
//                    .frame(width: 90, height: 90)
//                    .foregroundColor(Color(red: 75/255, green: 123/255, blue: 229/255))
//                ForEach(gameViewModel.mainRandomItem) { item in
//                    AsyncImage(url: URL(string: item.imageUrl))
//                        .frame(width: 70, height: 70)
//                }
//            }
            VStack {
                ForEach(gameViewModel.randomItems) { item in
                            AsyncImage(url: URL(string: item.imageUrl))
                                .frame(width: 70, height: 70)
                                .padding()
                                .background(Color(red: 75/255, green: 123/255, blue: 229/255))
                                .cornerRadius(10)
                                .lineLimit(2)
                }
            }
            
            
            
//            List(gameViewModel.randomItems) {
//                AsyncImage(url: URL(string: $0.imageUrl))
//            }
            
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
