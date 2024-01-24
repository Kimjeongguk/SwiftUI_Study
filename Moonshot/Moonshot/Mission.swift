//
//  Mission.swift
//  Moonshot
//
//  Created by jeongguk on 1/24/24.
//

import Foundation


struct Mission: Codable, Identifiable {
    struct CreRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CreRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
