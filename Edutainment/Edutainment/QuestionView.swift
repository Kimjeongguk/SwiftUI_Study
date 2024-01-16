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
    @State private var isNext = false
    
    var number: Int {
        var temp = array.first ?? 0
        arrayRemoveFirst()
        return temp
    }
    
    var body: some View {
        VStack {
            Form {
                
                Section {
                    Text("\(level) * \(number) = ?")
                }
                
                Section("정답") {
                    TextField("Answer", value: $answer, format: .number)
                }
            }
            Button("NEXT") {
                tapNextButton()
                isNext = true
            }
            .playStyle()
        }
        .alert("Result", isPresented: $isNext) {
            Text("OK")
        } message: {
            Text("correct")
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
    
    func arrayRemoveFirst(){
        if array.isEmpty {
            
        } else {
            array.removeFirst()
        }
    }
    
    
}

#Preview {
    QuestionView(level: 5, question: 5)
}
