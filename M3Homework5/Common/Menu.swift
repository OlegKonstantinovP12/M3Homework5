//
//  Menu.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 03.01.2026.
//

import Foundation

enum TypeMenu {
    case coffee([Drink])
    case tea([Drink])
    case eat
}

enum CupSize: String {
    case small = "Sm"
    case medium = "Md"
    case large = "Lr"
    case extraLarge = "Xl"
    
}

struct Menu: Identifiable {
    let id: String = UUID().uuidString
    let typeMenu: TypeMenu
}

struct Drink: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let image: String
    var rate: Double
    var discounted: Bool? = false
    var description: String? = nil
    let price: [PriceCup]
}


struct PriceCup: Identifiable {
    let id: String = UUID().uuidString
    let size: CupSize
    let originalPrice: Double
    var discountPrice: Double? = nil
}

struct Discount: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let discount: Double
}
