//
//  Activitie.swift
//  TrackingApp
//
//  Created by jeongguk on 1/31/24.
//

import Foundation

struct ActivitieItem:Codable, Hashable {
    var uuid = UUID()
    let title: String
    let description: String
    var count: Int
}
