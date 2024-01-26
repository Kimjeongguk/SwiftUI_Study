//
//  ContentView6.swift
//  Moonshot
//
//  Created by jeongguk on 1/25/24.
//

import SwiftUI

struct ContentView6: View {
    @State private var isGridMode: Bool = true
    var body: some View {
        NavigationStack {
            if isGridMode {
                Grid {
                    ForEach(0..<10) {
                        Text("Grid \($0)")
                    }
                }.toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isGridMode.toggle()
                        }) {
                            Text(isGridMode ? "Grid" : "List")
                        }
                    }
                }
            }else {
                List {
                    ForEach(0..<10) {
                        Text("Item \($0)")
                    }
                }.toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isGridMode.toggle()
                        }) {
                            Text(isGridMode ? "Grid" : "List")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView6()
}
