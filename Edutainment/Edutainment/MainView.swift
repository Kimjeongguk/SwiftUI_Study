//
//  ContentView.swift
//  Edutainment
//
//  Created by jeongguk on 1/15/24.
//

import SwiftUI

struct PlayButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .frame(width: 200, height: 80)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

extension View {
    func playStyle() -> some View {
        modifier(PlayButton())
    }
}

struct MainView: View {
    private var levelView = LevelView()
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Multiplication Table")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
                
                Spacer()
                Spacer()
                NavigationLink(destination: LevelView()) {
                    Text("START")
                }
                .playStyle()
                
                Spacer()
            }
        }
    }
}

#Preview {
    MainView()
}
