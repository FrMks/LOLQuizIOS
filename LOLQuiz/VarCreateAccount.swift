//
//  VarCreateAccount.swift
//  LOLQuiz
//
//  Created by Максим Французов on 21.06.2022.
//

import Foundation

class VarCreateAccount: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var againPassword = ""
}
