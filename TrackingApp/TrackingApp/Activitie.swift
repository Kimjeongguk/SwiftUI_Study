//
//  Activitie.swift
//  TrackingApp
//
//  Created by jeongguk on 1/31/24.
//

import Foundation

struct ActivitieItem: Codable, Hashable, Identifiable {
    var id = UUID()
    let title: String
    let description: String
    var count: Int
}

@Observable
class Activities: Hashable {
    var items = [ActivitieItem]() {
        didSet {
            save()
        }
    }
    
    init() {
        if let saveItems = UserDefaults.standard.data(forKey: "items") {
            if let decodedItems = try? JSONDecoder().decode([ActivitieItem].self, from: saveItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: "items")
        }
    }
    
    func removeItem(item: ActivitieItem) {
        items = items.filter { $0.id != item.id}
    }
    
    static func == (lhs: Activities, rhs: Activities) -> Bool {
        lhs.items == rhs.items
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(items)
    }
}
