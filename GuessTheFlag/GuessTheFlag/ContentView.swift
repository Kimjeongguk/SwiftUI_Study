//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by jeongguk on 1/2/24.
//

import SwiftUI

struct MainTitle: ViewModifier {
    var title: String
    func body(content: Content) -> some View {
        Text(title)
            .font(.largeTitle)
            .foregroundStyle(.blue)
            .fontWeight(.heavy)
    }
}

struct SpecificImage: ViewModifier {
    var name: String
    var amount: Double
    var isTap: Bool = false
    func body(content: Content) -> some View {
        var theRest = isTap && amount != 360
        Image(name)
            .clipShape(.capsule)
            .shadow(radius: 5)
            .blur(radius: theRest ? 3.0 : 0)
            .scaleEffect(theRest ? 0.6 : 1)
            .rotation3DEffect(
                .degrees(amount == 360 ? 360 : 0), axis: (x: 0.0, y: 1.0, z: 0.0)
            )
    }
}

extension View {
    func flagImage(name: String, amount: Double, isTap: Bool) -> some View {
        modifier(SpecificImage(name: name, amount: amount, isTap: isTap))
    }
    
    func mainTitle(title: String) -> some View {
        modifier(MainTitle(title: title))
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var selectFlag = 0
    @State private var round = 0
    @State private var endGame = false
    @State private var amountAnimations = [0.0, 0.0, 0.0]
    @State private var showAnimation = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                mainTitle(title: "Guess the Flag")
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button() {
                            withAnimation() {
                                amountAnimations[number] += 360
                                flagTapped(number)
                                showAnimation = true
                            }
                        } label: {
                            Image(countries[number])
                            flagImage(name: countries[number], amount: amountAnimations[number], isTap: showAnimation)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if scoreTitle == "Wrong" {
                Text("Wrong! That's the flag of \(countries[selectFlag])")
            } else {
                Text("Your score is \(score)")
            }
        } 
        .alert("Finsh Game", isPresented: $endGame) {
            Button("Restart", action: reset)
        } message: {
            Text("Do you want a restart?")
        }
    }
    
    func flagTapped(_ number: Int) {
        selectFlag = number
        round += 1
        if number == correctAnswer {
            score += 100
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func mixFlag() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        amountAnimations = [0.0, 0.0, 0.0]
        showAnimation = false
    }
    
    func askQuestion() {
        if round >= 3 {
            endGame = true
        } else {
            mixFlag()
        }
        
    }
    
    func reset() {
        score = 0
        round = 0
        mixFlag()
    }
}

#Preview {
    ContentView()
}
