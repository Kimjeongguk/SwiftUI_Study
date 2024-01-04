//
//  FavoriteButton.swift
//  HelloWorld
//
//  Created by jeongguk on 12/8/23.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var store: Store
    let product: Product
    
    private var imageName: String {
        product.isFavorite ? "heart.fill" : "heart"
    }
    var body: some View {
        Button(action: {
            self.store.toggleFavorite(of: self.product)
        }) {
            Symbol(imageName, imageScale: .large, color: .peach)
                .frame(width: 32, height: 32)
                .onTapGesture {
                    self.store.toggleFavorite(of: self.product)
                }
        }
    }
}

#Preview {
    FavoriteButton(product: productSamples[0])
}
