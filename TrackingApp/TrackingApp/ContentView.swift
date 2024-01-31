//
//  ContentView.swift
//  TrackingApp
//
//  Created by jeongguk on 1/31/24.
//

import SwiftUI

@Observable
class Activities: Hashable {
    var items = [ActivitieItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    static func == (lhs: Activities, rhs: Activities) -> Bool {
        lhs.items == rhs.items
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(items)
    }
}

struct ContentView: View {
    @State private var activities = Activities()
    var body: some View {
        NavigationStack {
            ScrollView {
                
            }
            .toolbar {
                NavigationLink(value: activities) {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("Tracking_APP")
            .navigationDestination(for: Activities.self) { activities in
                AddActivitieView(activitie: activities)
            }
        }
    }
}

#Preview {
    ContentView()
}
