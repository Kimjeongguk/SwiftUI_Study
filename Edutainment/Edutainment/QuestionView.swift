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
    @State private var userAnswer = 0
    @State private var answer = 0
    @State private var score = 0
    @State private var array: [Int] = []
    @State private var isNext = false
    @State private var isTotalScore = false
    @State private var resultMessage = "틀렸습니다."
    
    var number: Int {
        let temp = array.first ?? 0
        return temp
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("\(level) * \(number) = ?")
                }
                
                Section("정답") {
                    TextField("Answer", value: $userAnswer, format: .number)
                        .keyboardType(.decimalPad)
                }
            }
            Button("NEXT") {
                correctCheck()
            }
            .playStyle()
        }
        .alert("Result", isPresented: $isNext) {
            Button("OK", action: tapNextButton)
        } message: {
            Text(resultMessage)
        }
        .alert("Total Score", isPresented: $isTotalScore) {
            Button("처음으로", action: mainPage)
        } message: {
            Text("점수: \(score)")
        }
        .onAppear(){
            setArray()
        }
    }
        
    
    func setArray() {
        var tempArray: [Int] = []
        for value in 1...20 {
            tempArray.append(value)
        }
        tempArray.shuffle()
        for i in 0..<question {
            array.append(tempArray[i])
        }
    }
    
    func tapNextButton() {
        arrayRemoveFirst()
    }
    
    func correctCheck() {
        answer = level * array[0]
        if answer == userAnswer {
            resultMessage = "정답입니다."
            score += 100
        } else {
            resultMessage = "틀렸습니다."
        }
        userAnswer = 0
        isNext = true
    }
    
    func arrayRemoveFirst(){
        array.removeFirst()
        isTotalScore = number == 0 ? true : false
    }
    
    func mainPage() {
        NavigationUtil.popToRootView()
    }
    
}

#Preview {
    QuestionView(level: 2, question: 2)
}
