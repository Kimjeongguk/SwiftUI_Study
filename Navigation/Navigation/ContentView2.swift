//
//  ContentView2.swift
//  Navigation
//
//  Created by jeongguk on 1/26/24.
//

import SwiftUI

struct ContentView2: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path:  $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }
                
                Button("Show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64") {
                    path = [1,2,3,4,5,6,7,32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ContentView2()
}
