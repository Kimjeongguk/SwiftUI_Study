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
    
    var body: some View {
        Text("\(level), \(question)")
    }
}

#Preview {
    QuestionView(level: 5, question: 5)
}
