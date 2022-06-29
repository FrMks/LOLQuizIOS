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
        var generateMainRandomItem = result.randomElement()!
        while generateMainRandomItem.lvl1Components.count != 0 {
            generateMainRandomItem = result.randomElement()!
        }
        mainRandomItem.append(generateMainRandomItem)
        print(generateMainRandomItem)
    }
    
    func testTakeCountOfLv1Main() -> Int {
        var countOfLv1Main = mainRandomItem[0].lvl1Components.count
        return countOfLv1Main
    }
    
    func testGenerateRandomItems() {
        var generateItems = [LolItem]()
        randomItems.removeAll()
        var generateItemsCount = 0
        var testTakeCountOfLv1Main = testTakeCountOfLv1Main()
        while generateItemsCount != randomItemsCount {
            var randomItem = result.randomElement()
            if testTakeCountOfLv1Main < 0 {
                while mainRandomItem[0].lvl1Components[testTakeCountOfLv1Main] != randomItem?.id {
                    randomItem = result.randomElement()
                    if generateItems.contains(where: { $0.name == randomItem?.name }) {
                            continue
                    }
                    testTakeCountOfLv1Main -= 1
                    generateItems.append(randomItem!)
                }
            } else {
                if generateItems.contains(where: { $0.name == randomItem?.name }) {
                    continue
                } else {
                    generateItems.append(randomItem!)
                }
            }
        }
        randomItems.append(contentsOf: generateItems)
        print("randomItems is append")
    }
    
//    func testGenerateRandomItems() {
//        var generateItems = [LolItem]()
//        randomItems.removeAll()
//        var randomItem = result.randomElement()
//        var generateItemsCount = 0
//        while generateItemsCount != randomItemsCount {
//            while mainRandomItem[0].lvl1Components[takeCountOfLv1Main() - 1] != randomItem?.id {
//                randomItem = result.randomElement()
//            }
////            var index = 0
////            while index != 5 {
////                if generateItems.contains(where: { generateItems[index].id == randomItem.id }) {
////                        continue
////                }
////                index += 1
////            }
//
//            generateItemsCount += 1
//            generateItems.append(randomItem!)
//        }
//        randomItems.append(contentsOf: generateItems)
//    }
    
//    func testGenerateRandomItems() {
//        mainRandomItem.removeAll()
//        randomItems.removeAll()
//        var generateItems = [LolItem]()
//        var generateItemsCount = 0
//        var generateMainRandomItem = result.randomElement()!
//        while generateMainRandomItem.lvl1Components == nil {
//            generateMainRandomItem = result.randomElement()!
//        }
//        mainRandomItem.append(generateMainRandomItem)
//        while generateItemsCount != randomItemsCount {
//            var randomItem = result.randomElement()!
//            var countOfIdLv1Components = generateMainRandomItem.lvl1Components.count
//            while countOfIdLv1Components != 0 {
//                countOfIdLv1Components -= 1
//                while generateMainRandomItem.lvl1Components[countOfIdLv1Components] != randomItem.id {
//                    randomItem = result.randomElement()!
//                }
//            }
//            if generateItems.contains(where: { $0.id == randomItem.id }) {
//                    continue
//            }
//            generateItems.append(randomItem)
//            generateItemsCount += 1
//        }
//        randomItems.append(contentsOf: generateItems)
//        print(randomItems)
//    }
}

struct LolItem: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let imageUrl: String
    //let stats: [String, String]
    let lvl1Components: [Int]
}
