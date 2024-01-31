//
//  AddActivitieView.swift
//  TrackingApp
//
//  Created by jeongguk on 1/31/24.
//

import SwiftUI

struct AddActivitieView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var description = ""
    
    var activitie: Activities
    var body: some View {
        Form {
            Section("제목") {
                TextField("Name", text: $name)
            }
            
            Section("설명") {
                TextField("Description", text: $description)
            }
        }
        .toolbar {
            Button("추가") {
                save()
            }
        }
    }
    
    func save() {
        let item = ActivitieItem(title: name, description: description, count: 0)
        activitie.items.append(item)
        if name == "" {
            
        }else if description == "" {
            
        } else {
            dismiss()
        }
    }
}

#Preview {
    AddActivitieView(activitie: Activities())
}
