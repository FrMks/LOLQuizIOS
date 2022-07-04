//
//  GameViewModel.swift
//  LOLQuiz
//
//  Created by Максим Французов on 24.06.2022.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var result = [LolItem]()
    @Published var randomItems = [LolItem]()
    @Published var mainRandomItem = [LolItem]()
    let randomItemsCount = 6
    //let randomItemsCount = 3
    
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
    
    func testGenerateRandomNainItem() {
        mainRandomItem.removeAll()
        var generateMainItem = [LolItem]()
        var generateMainRandomItem = result.randomElement()!
        while generateMainRandomItem.lvl1Components.count == 0 {
            generateMainRandomItem = result.randomElement()!
        }
        generateMainItem.append(generateMainRandomItem)
        mainRandomItem.append(contentsOf: generateMainItem)
        print(generateMainRandomItem)
    }
    
    func testTakeCountOfLv1Main() -> Int {
        var countOfLv1Main = mainRandomItem[0].lvl1Components.count
        return countOfLv1Main
    }
    
    
    func testGenerateRandomItems() {
        var generateItems = [LolItem]()
        randomItems.removeAll()
        var countOfLv1Components = testTakeCountOfLv1Main()
        var indexOfMainGenerateItem = 0
        var randomItem: LolItem
        //result.first(where: {$0.id == ....})
        
        //MARK: ForEach для нахождения айтамов lv1Com.
        
        for i in 0...countOfLv1Components - 1 {
            randomItem = result.first(where: {  $0.id == mainRandomItem[0].lvl1Components[i] && mainRandomItem[0].lvl1Components[i] != mainRandomItem[0].id  })!
            generateItems.append(randomItem)
        }
        
//        while indexOfMainGenerateItem != countOfLv1Components {
//            randomItem = result.randomElement()!
//            if randomItem.id == mainRandomItem[0].lvl1Components[indexOfMainGenerateItem] {
//                if generateItems.contains(where: { $0.id == randomItem.id }) {
//                    continue
//                } else {
//                    generateItems.append(randomItem)
//                    indexOfMainGenerateItem += 1
//                }
//            } else {
//                continue
//            }
//        }
        
        while generateItems.count != randomItemsCount {
            randomItem = result.randomElement()!
            if generateItems.contains(where: {  $0.id == randomItem.id && randomItem.id != mainRandomItem[0].id  }) {
                continue
            } else {
                generateItems.append(randomItem)
            }
        }
        var shuffledItems = generateItems.shuffled()
        randomItems.append(contentsOf: shuffledItems)
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
