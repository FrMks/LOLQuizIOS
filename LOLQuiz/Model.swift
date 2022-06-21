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
    }
    @Published var screen = Screen.createScreen
    //@Published var loginAccount = false
    //@Published var main = false
}
