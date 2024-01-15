//
//  LevelView.swift
//  Edutainment
//
//  Created by jeongguk on 1/15/24.
//

import SwiftUI

struct LevelView: View {
    @State private var level = 1
    @State private var question = 5
    @State private var questions = [5, 10, 15, 20]
    var body: some View {
        VStack {
            Spacer()
            Section("선택"){
                VStack {
                    ForEach(0..<3) { i in
                        HStack {
                            ForEach(1..<5) { j in
                                Button("\(i * 4 + j)") {
                                    getLevel(num: i*4+j)
                                }
                                .frame(width: 50, height: 50)
                                .background(.separator)
                                
                            }
                        }
                    }
                }
            }
            Spacer()
            Section("문제 수") {
                Picker("문제 수", selection: $question) {
                    ForEach(questions, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            Spacer()
            Spacer()
            Text("\(level) 단계 \(question) 문제 ")
            Spacer()
            NavigationLink(destination: QuestionView(level: level, question: question)) {
                Text("Play")
            }
            .playStyle()
        }
    }
    func getLevel(num: Int) {
        level = num
    }
}

#Preview {
    LevelView()
}
