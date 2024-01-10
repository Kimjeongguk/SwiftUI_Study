//
//  ContentView.swift
//  Animations
//
//  Created by jeongguk on 1/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 2.0
    var body: some View {
        Button("Tap Me") {
//            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
        .overlay(
            Circle()
                .stroke(.orange)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeOut(duration: 2)
                    .repeatForever(autoreverses: false), value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 0.0
        }
//        .animation(.spring(duration:1, bounce: 0.9), value: animationAmount)
//        .animation(.easeInOut(duration: 2).delay(1).repeatCount(2, autoreverses: true), value: animationAmount)
        
    }
}

#Preview {
    ContentView()
}
