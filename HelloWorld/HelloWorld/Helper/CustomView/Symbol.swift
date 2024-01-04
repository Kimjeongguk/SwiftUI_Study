//
//  Symbol.swift
//  HelloWorld
//
//  Created by jeongguk on 12/13/23.
//

import SwiftUI

struct Symbol: View {
    let systemName: String
    let imageScale: Image.Scale
    let color: Color
    
    init(_ systemName: String, imageScale: Image.Scale = .medium, color: Color) {
        self.systemName = systemName
        self.imageScale = imageScale
        self.color = color
    }
    var body: some View {
        Image(systemName: systemName)
            .imageScale(imageScale)
            .foregroundStyle(color)
    }
}

#Preview {
    Symbol("heart.fill", color: .red)
}
