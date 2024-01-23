//
//  ContentView2.swift
//  Moonshot
//
//  Created by jeongguk on 1/23/24.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView2()
}
