//
//  ContentView.swift
//  RPSGame
//
//  Created by jeongguk on 1/5/24.
//

import SwiftUI
//🖐️✌️✊
struct ContentView: View {
    @State var app = ""
    @State var user = "rock"
    
    private var appArray = ["rock", "paper", "scissors"].shuffled()
    private var userArray = ["rock", "paper", "scissors"]
    computer = computer
    var body: some View {
        
        VStack {
            Section("선택"){
                ForEach(0..<3) {
                    Button(userArray[$0]) {
                        print("")
                    }
                    .font(.largeTitle)
                    .frame(width: 300, height: 100)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .background(.blue)
                    .clipShape(.capsule)
                    .padding()
                }
            }
        }
        .padding()
    }
    
    func mmmm(user: String){
        if user == rock
    }
}

#Preview {
    ContentView()
}
