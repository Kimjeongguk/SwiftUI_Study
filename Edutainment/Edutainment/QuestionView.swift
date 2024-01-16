//
//  QuestionView.swift
//  Edutainment
//
//  Created by jeongguk on 1/15/24.
//

import SwiftUI

struct QuestionView: View {
    var level: Int
    var question: Int
    @State private var answer = 0
    @State private var array: [Int] = []
    
    var body: some View {
        VStack {
            Text("\(level), \(question)")
            TextField("Answer", value: $answer, format: .number)
        }
    }
    
    func setArray() {
        for i in 1...question {
            array.append(i)
        }
        array.shuffle()
    }
}

#Preview {
    QuestionView(level: 5, question: 5)
}
