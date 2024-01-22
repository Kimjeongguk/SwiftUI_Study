//
//  ContentView6.swift
//  iExpense
//
//  Created by jeongguk on 1/22/24.
//

import SwiftUI

struct AmountText: ViewModifier {
    var amount: Double
    func body(content: Content) -> some View {
        if amount >= 100 {
            content
                .font(.largeTitle)
                .foregroundStyle(.red)
        } else if amount < 10 {
            content
                .font(.subheadline)
                .foregroundStyle(.green)
        } else {
            content
                .font(.headline)
                .foregroundStyle(.yellow)
        }
    }
}

extension View {
    func amountStyle(amount: Double) -> some View {
        modifier(AmountText(amount: amount))
    }
}

struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentView6: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                            .amountStyle(amount: item.amount)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView6()
}

