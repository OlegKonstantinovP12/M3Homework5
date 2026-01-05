//
//  Menu.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 03.01.2026.
//

import Foundation



struct Menu: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let typeMenu: TypeMenu
}

struct Drink: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let name: String
    let image: String
    var rate: Double
    var discounted: Bool? = false
    var description: String? = nil
    let price: [PriceCup]
}


struct PriceCup: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let size: CupSize
    let originalPrice: Double
    var discountPrice: Double? = nil
}

struct Discount: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let name: String
    let discount: Double
}

struct FeaturedDrink: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let drink: Drink
    let category: DrinkByType
}
