//
//  MissionView.swift
//  Moonshot
//
//  Created by jeongguk on 1/24/24.
//

import SwiftUI



struct MissionView: View {
    let mission: Mission
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding()
                
                Text(mission.formattedLaunchDate)
                    .font(.headline)
                
                VStack(alignment: .leading) {
                    line()
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    line()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                CrewMemberView(mission: mission, astronauts: astronauts)
                
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    init(mission: Mission) {
        self.mission = mission
    }
    
    func line() -> some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return MissionView(mission: missions[1])
        .preferredColorScheme(.dark)
}
