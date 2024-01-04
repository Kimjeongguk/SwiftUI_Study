//
//  Home.swift
//  HelloWorld
//
//  Created by jeongguk on 11/30/23.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject private var store: Store
    var body: some View {
        NavigationView {
            List(store.products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    ProductRow(product: product)
                }
            }
            .buttonStyle(PlainButtonStyle())
            .navigationTitle("과일마트")
        }
    }
}

struct Previews: PreviewProvider {
    static var previews: some View {
        Preview(source: Home())
            .environmentObject(Store())
    }
}
#Preview {
    Preview(source: Home())
        .environmentObject(Store())
}

