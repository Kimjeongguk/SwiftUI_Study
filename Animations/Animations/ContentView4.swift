//
//  ContentView4.swift
//  Animations
//
//  Created by jeongguk on 1/11/24.
//

import SwiftUI

struct ContentView4: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .animation(.default, value: enabled)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.9), value: enabled)
        
    }
}

#Preview {
    ContentView4()
}
