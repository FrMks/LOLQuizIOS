//
//  DragAndDropContentView.swift
//  LOLQuiz
//
//  Created by Максим Французов on 27.06.2022.
//

import SwiftUI

struct DragAndDropContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Home()
        }
    }
}

struct DragAndDropContentView_Previews: PreviewProvider {
    static var previews: some View {
        DragAndDropContentView()
    }
}
