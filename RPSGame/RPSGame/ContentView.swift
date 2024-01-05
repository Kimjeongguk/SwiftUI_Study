//
//  ContentView.swift
//  RPSGame
//
//  Created by jeongguk on 1/5/24.
//

import SwiftUI
//🖐️✌️✊
enum ResultGame {
    case win
    case lose
    case draws
}

struct CustomButton: ViewModifier {
    var title: String
    var void: () -> Void
    func body(content: Content) -> some View {
        Button(title, action: void)
            .font(.largeTitle)
            .frame(width: 300, height: 100)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .background(.blue)
            .clipShape(.capsule)
            .padding()
    }
}

extension View {
    func clickButton(title:String, void: @escaping () -> Void) -> some View {
        modifier(CustomButton(title: title, void: void))
    }
}

struct ContentView: View {
    @State var score = 0
    @State var round = 0
    @State var app = ""
    @State var user = ResultGame.win
    @State var showingScore = false
    @State var reset = false
    @State var correctAnswer = Int.random(in: 0...2)
    @State private var appArray = ["rock", "paper", "scissors"].shuffled()
    private var userArray = ["rock", "paper", "scissors"]
    
    var body: some View {
        
        VStack {
            Section("선택"){
                ForEach(0..<3) { index in
                    clickButton(title: userArray[index]){
                        resultOfGame(userSelet: userArray[index])
                    }
                }
            }
        }
        .padding()
        .alert("SCORE", isPresented: $showingScore) {
            Button("Next Game", action: resetGame)
        } message: {
            switch user {
            case .win: Text("app:\(app) 이겼다!")
            case .draws: Text("app:\(app) 비겼어")
            case .lose: Text("app:\(app) 졌어 ㅜㅜ")
            }
        }
        .alert("Totle Score", isPresented: $reset){
            Button("처음으로", action: totalScore)
        } message: {
            Text("총점수: \(score)")
        }
    }
    
    func appResult() {
        app = appArray[correctAnswer]
    }
    
    func resultOfGame(userSelet: String) {
        appResult()
        if userSelet == "rock" {
            if app == "rock" {
                self.user = .draws
            } else if app == "paper" {
                self.user = .lose
            } else if app == "scissors" {
                self.user = .win
            }
        } else if userSelet == "paper" {
            if app == "rock" {
                self.user = .win
            } else if app == "paper" {
                self.user = .draws
            } else if app == "scissors" {
                self.user = .lose
            }
        } else if userSelet == "scissors" {
            if app == "rock" {
                self.user = .lose
            } else if app == "paper" {
                self.user = .win
            } else if app == "scissors" {
                self.user = .draws
            }
        }
        round += 1
        scoreCalculation()
        showingScore = true
    }
    
    func scoreCalculation() {
        switch self.user {
        case .draws: break
        case .lose: score -= 100
        case .win: score += 100
        }
    }
    
    func totalScore() {
        round = 0
        score = 0
    }
    
    func resetGame() {
        if round > 2 {
            reset = true
        }
        appArray.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
}

#Preview {
    ContentView()
}
