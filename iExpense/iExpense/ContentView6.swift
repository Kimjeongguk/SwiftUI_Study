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

struct ExpenseItem: Identifiable, Codable, Hashable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses: Hashable {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    var businessItems: [ExpenseItem] {
        items.filter { $0.type == "Business" }
    }
    
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == "Personal" }
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
    
    static func == (lhs: Expenses, rhs: Expenses) -> Bool {
        lhs.items == rhs.items
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(items)
        }
    
}

struct ContentView6: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var path = NavigationPath()
    @State private var title = "iExpense"
    
    func itemRows(name: String, type: String, amount: Double) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                
                Text(type)
            }
            
            Spacer()
            
            Text(amount, format: .currency(code: "USD"))
                .amountStyle(amount: amount)
        }
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Business") {
                    ForEach(expenses.businessItems) { item in
                        itemRows(name: item.name, type: item.type, amount: item.amount)
                    }
                    .onDelete(perform: removeBusinessItem)
                }
                
                Section("Personal") {
                    ForEach(expenses.personalItems) { item in
                        itemRows(name: item.name, type: item.type, amount: item.amount)
                    }
                    .onDelete(perform: removePersonalItem)
                }
                
                ForEach(expenses.items) { item in
                    itemRows(name: item.name, type: item.type, amount: item.amount)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(value: expenses) {
                        Text("Add")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Expense", systemImage: "plus") {
                        showingAddExpense = true
                    }
                }
                
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
            .navigationDestination(for: Expenses.self) { selection in
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func removeBusinessItem(at offsets: IndexSet) {
        offsets.forEach { index in
            expenses.items = expenses.items.filter { $0.id != expenses.businessItems[index].id }
        }
    }
    
    func removePersonalItem(at offsets: IndexSet) {
        offsets.forEach { index in
            expenses.items = expenses.items.filter { $0.id != expenses.personalItems[index].id }
        }
    }
}

#Preview {
    ContentView6()
}

