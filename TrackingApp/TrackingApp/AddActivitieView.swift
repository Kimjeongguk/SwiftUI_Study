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
    @State private var isEmpty = false
    @State private var message = ""
    
    var activitie: Activities
    var body: some View {
//        NavigationStack{
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
            .alert("알림", isPresented: $isEmpty) {
                Button("확인") {
                    
                }
            } message: {
                Text(message)
            }
//        }
    }
    
    func save() {
        if name == "" {
            message = "이름을 입력해 주세요"
            isEmpty = true
        }else if description == "" {
            message = "설명을 작성해 주세요"
            isEmpty = true
        } else {
            let item = ActivitieItem(title: name, description: description, count: 0)
            activitie.items.append(item)
            dismiss()
        }
    }
}

#Preview {
    AddActivitieView(activitie: Activities())
}
