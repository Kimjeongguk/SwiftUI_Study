//
//  ContentView.swift
//  Project_one
//
//  Created by Jeongguk Kim on 12/30/23.
//

import SwiftUI

struct ResultVAlue: ViewModifier {
    var result: Double
    func body(content: Content) -> some View {
        Text(result, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            .foregroundStyle(.red)
    }
}


extension View {
    func resultStyle(result: Double) -> some View {
        modifier(ResultVAlue(result: result))
    }
}

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    @FocusState private var amountIsFocused: Bool
    
    
    var totalPer: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        return checkAmount + tipValue
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = totalPer / peopleCount
        
        return amountPerPerson
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much do you want tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
//                    .pickerStyle(.segmented)
//                    .pickerStyle(.navigationLink)
                }
                
                Section("1인당 금익") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("총금액") {
                    if tipPercentage == 0 {
                        resultStyle(result: totalPer)
                    } else {
                        Text(totalPer, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
