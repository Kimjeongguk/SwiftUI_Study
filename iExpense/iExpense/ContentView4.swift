//
//  ContentView4.swift
//  iExpense
//
//  Created by jeongguk on 1/19/24.
//

import SwiftUI

struct ContentView4: View {
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
            
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

#Preview {
    ContentView4()
}
