//
//  Astronaut.swift
//  Moonshot
//
//  Created by jeongguk on 1/24/24.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
