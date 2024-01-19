//
//  ContentView.swift
//  iExpense
//
//  Created by jeongguk on 1/19/24.
//
import Observation
import SwiftUI

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
