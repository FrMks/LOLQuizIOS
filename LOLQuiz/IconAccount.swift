//
//  IconAccount.swift
//  LOLQuiz
//
//  Created by Максим Французов on 22.06.2022.
//

import SwiftUI

struct IconAccount: View {
    var body: some View {
        ZStack {
            Circle()
                .opacity(0.7)
                .foregroundColor(Color(red: 75/255, green: 123/255, blue: 229/255))
                .frame(width: 150, height: 150)

            Image("AccountIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
        }
    }
}

struct IconAccount_Previews: PreviewProvider {
    static var previews: some View {
        IconAccount()
    }
}
