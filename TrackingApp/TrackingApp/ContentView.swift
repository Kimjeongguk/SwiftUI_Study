//
//  ContentView.swift
//  TrackingApp
//
//  Created by jeongguk on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(activities.items, id: \.self) { activitie in
                        NavigationLink(value: activitie) {
                            Text("aa")
                        }
                    }
                }
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
            .navigationDestination(for: ActivitieItem.self) { item in
                ActivitieView(activities: activities, activitie: item)
            }
        }
    }
}

#Preview {
    ContentView()
}
