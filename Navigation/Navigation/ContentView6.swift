//
//  ContentView^.swift
//  Navigation
//
//  Created by jeongguk on 1/29/24.
//

import SwiftUI

struct ContentView6: View {
    @State private var title = "SwiftUI"
    var body: some View {
        NavigationStack {
            Text("hi")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            
                        }
                        
                        Button("Or Tap Me") {
                            
                        }
                    }
                }
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView6()
}
