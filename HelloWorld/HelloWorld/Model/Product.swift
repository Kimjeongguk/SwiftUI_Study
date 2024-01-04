//
//  Product.swift
//  HelloWorld
//
//  Created by jeongguk on 11/30/23.
//

import Foundation

struct Product {
    var id: UUID = UUID()
    let name: String
    let imageName: String
    let price: Int
    let description: String
    var isFavorite: Bool = false
}

let productSamples = [
    Product(name: "나는야 무화과", imageName: "fig", price: 3100, description: "소화가 잘되고 변비에 좋은 달달한 국내산 무화과에요. 고기와 찰떡궁합!", isFavorite: false),
    Product(name: "유기농 아보카도", imageName: "avocado", price: 2900, description: "미네랄도 풍부하고, 요리 장식과 소스로도 좋은 아보카도입니다", isFavorite: false),
    Product(name: "바나나 안 바나나", imageName: "banana", price: 2400, description: "달콤한 맛의 바나나. 이렇게 맛있으니 내가 바나나 안 바나나?", isFavorite: true)
    ]

extension Product: Decodable {}
extension Product: Identifiable {}
extension Product: Equatable {}
