//
//  ContentView3.swift
//  Animations
//
//  Created by jeongguk on 1/10/24.
//

import SwiftUI

struct ContentView3: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.spring(duration: 1, bounce: 0)) {
                animationAmount += 360
            }
        }
        .padding(100)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

#Preview {
    ContentView3()
}
