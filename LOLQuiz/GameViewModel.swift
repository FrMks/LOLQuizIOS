//
//  GameViewModel.swift
//  LOLQuiz
//
//  Created by Максим Французов on 24.06.2022.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var result = [LolItem]()
    @Published var randomItems = [LolItem]()
    let randomItemsCount = 6
    
    func parseJSON() {
        guard let path = Bundle.main.path(forResource: "LOLQuizJSON", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)

        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode([LolItem].self, from: jsonData)
        }
        catch {
            print("Error: \(error)")
        }
    }
    
    func generateRandomItems() {
        randomItems.removeAll()
        var generateItems = [LolItem]()
        var generateItemsCount = 0
        while generateItemsCount != randomItemsCount {
            var randomItem = result.randomElement()!
            if generateItems.contains(where: { $0.id == randomItem.id }) {
                    continue
            }
            generateItems.append(randomItem)
            generateItemsCount += 1
        }
        randomItems.append(contentsOf: generateItems) 
        print(randomItems)
    }
}

struct LolItem: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let imageUrl: String
    //let stats: [String, String]
    let lvl1Components: [Int]
}
