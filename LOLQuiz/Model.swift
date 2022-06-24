//
//  Model.swift
//  LOLQuiz
//
//  Created by Максим Французов on 21.06.2022.
//

import Foundation

class Model: ObservableObject {
    enum Screen {
        case loginScreen
        case createScreen
        case mainScreen
        case firstGameScreen
    }
    @Published var screen = Screen.createScreen
    
    
//    func jsonResult() {
//        var usedVolume:Int?
//        var usedPercent:Int?
//
//        guard let path = Bundle.main.path(forResource: "LOLQuizJSON", ofType: "json") else { return }
//        let url = URL(fileURLWithPath: path)
//
//        do {
//
//            let allData = try Data(contentsOf: url)
//            let json = try JSONSerialization.jsonObject(with: allData, options: []) as! [String: AnyObject]
//            if let uv = json["usedVolume"] as? Int {
//                usedVolume = uv
//            }
//
//            if let up = json["usedPercentage"] as? Int {
//                usedPercent = up
//            }
//
//        } catch let error as NSError {
//            print("Failed to load: \(error.localizedDescription)")
//        }
//    }
}

//struct LolItem: Codable, Identifiable {
//    let id: Int
//    let name: String
//    let price: Int
//    let imageUrl: String
//    //let stats: [String, String]
//    let lvl1Components: [Int]
//}
