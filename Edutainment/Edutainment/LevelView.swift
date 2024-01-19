//
//  LevelView.swift
//  Edutainment
//
//  Created by jeongguk on 1/15/24.
//

import SwiftUI

struct LevelButtonStyle: ViewModifier {
    var num: Int
    @Binding var level: Int
    @State var isEnable: Bool
    func body(content: Content) -> some View {
        Button("\(num)"){
            self.isEnable.toggle()
            level = num
        }
        .frame(width: 80, height: 80)
        .background(.separator)
        .foregroundStyle(.white)
        .animation(.default, value: isEnable)
        .clipShape(.rect(cornerRadius: isEnable ? 30 : 20))
    }
}

extension View {
    func levelButton(num: Int, level: Binding<Int>, isEnable: Bool) -> some View {
        modifier(LevelButtonStyle(num: num, level: level, isEnable: isEnable))
    }
}

struct LevelView: View {
    @State private var level = 1
    @State private var question = 5
    @State private var questions = [5, 10, 15, 20]
    @State private var isAnimation = false
    @State private var isEnables = []
    var body: some View {
        VStack {
            Spacer()
            Section("선택"){
                VStack {
                    ForEach(0..<3) { i in
                        HStack {
                            ForEach(1..<5) { j in
                                levelButton(num: i*4+j, level: $level, isEnable: false)
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
}

#Preview {
    LevelView()
}
