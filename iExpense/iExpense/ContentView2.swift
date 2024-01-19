//
//  ContentView2.swift
//  iExpense
//
//  Created by jeongguk on 1/19/24.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    var body: some View {
        Text("Hello \(name)!")
        
        Button("Dissmiss") {
            dismiss()
        }
    }
}

struct ContentView2: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "@twostraws")
        }
    }
}

#Preview {
    ContentView2()
}
