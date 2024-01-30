//
//  AddView.swift
//  iExpense
//
//  Created by jeongguk on 1/22/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var USDAmount = 0.0
    @State private var amount = 0.0
    @State private var currency = "USD"
    
    var expenses: Expenses
    let currencyConverter = CurrencyConverter()
    let types = ["Business", "Personal"]
    
    var body: some View {
//        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Currency", selection: $currency) {
                    ForEach(currencyConverter.currencys, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: currency))
                    .keyboardType(.decimalPad)
                
                
            }
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                       dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        USDAmount = currencyConverter.convert(amount: amount, fromCurrency: currency, toCurrency: "USD") ?? 0.0
                        let item = ExpenseItem(name: name, type: type, amount: USDAmount)
                        expenses.items.append(item)
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
            
//        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
