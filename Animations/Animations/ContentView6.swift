//
//  ContentView6.swift
//  Animations
//
//  Created by jeongguk on 1/11/24.
//

import SwiftUI

struct ContentView6: View {
    @State private var isShowingRed = false
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
        }
        
        if isShowingRed {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
        }
    }
}

#Preview {
    ContentView6()
}
