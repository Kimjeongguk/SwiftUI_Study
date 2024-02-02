//
//  ActivitieView.swift
//  TrackingApp
//
//  Created by jeongguk on 2/1/24.
//

import SwiftUI

struct ActivitieView: View {
    @Environment(\.dismiss) var dismiss
    let activities: Activities
    var activitie: ActivitieItem
    var body: some View {
        VStack {
            Spacer()
            
            Text(activitie.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Text(activitie.description)
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            Text("횟수 : \(activitie.count)")
                .font(.title2)
            
            Button(action: {
                activities.countUp(item: activitie)
                dismiss()
            }){
                Text("완료")
                    .foregroundStyle(.white)
                    .font(.title)
                    .frame(width: 300, height: 100)
                    .background(.blue)
                    .clipShape(.capsule)
            }
            .contentShape(Rectangle())
            
            Spacer()
        }
        .toolbar {
            Button("삭제") {
                activities.removeItem(item: activitie)
                dismiss()
            }
            .foregroundStyle(.red)
        }
    }
}

#Preview {
    ActivitieView(activities: Activities(), activitie: ActivitieItem(title: "운동", description: "운동을 합니다", count: 2))
}
