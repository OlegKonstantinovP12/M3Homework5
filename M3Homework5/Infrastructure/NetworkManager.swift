//
//  NetworkManager.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import Foundation

class NetworkManager {
    func getData() -> [Menu] {
        let coffee = Menu(typeMenu: .coffee([
            Drink(name: "Hot Mocha Cappuccino Latte", image: "cappuccinoLatte", rate: 4.0, price: [PriceCup(size: .small, originalPrice: 3.61),
                                                                                        PriceCup(size: .medium, originalPrice: 4.61),
                                                                                        PriceCup(size: .large, originalPrice: 5.61),
                                                                                        PriceCup(size: .extraLarge, originalPrice: 6.61)]),
            Drink(name: "Caffè Americano", image: "americano", rate: 3.8, price: [PriceCup(size: .small, originalPrice: 3.61),
                                                                       PriceCup(size: .medium, originalPrice: 4.61),
                                                                       PriceCup(size: .large, originalPrice: 5.61),
                                                                       PriceCup(size: .extraLarge, originalPrice: 6.61)]),
            Drink(name: "Cappuccino", image: "cappuccino", rate: 5.0, price: [PriceCup(size: .small, originalPrice: 3.61),
                                                                   PriceCup(size: .medium, originalPrice: 4.61),
                                                                   PriceCup(size: .large, originalPrice: 5.61),
                                                                   PriceCup(size: .extraLarge, originalPrice: 6.61)]),
            Drink(name: "Peppermint White Chocolate Mocha", image: "chocolateMocha", rate: 3.9, price: [PriceCup(size: .small, originalPrice: 3.61),
                                                                                             PriceCup(size: .medium, originalPrice: 4.61),
                                                                                             PriceCup(size: .large, originalPrice: 5.61),
                                                                                             PriceCup(size: .extraLarge, originalPrice: 6.61)]),
            ]))
        let tea = Menu(typeMenu: .tea([
            Drink(name: "Honey Citrus Mint Tea", image: "mintTea", rate: 2.3, price: [PriceCup(size: .small, originalPrice: 3.61),
                                                                           PriceCup(size: .medium, originalPrice: 4.61),
                                                                           PriceCup(size: .large, originalPrice: 5.61),
                                                                           PriceCup(size: .extraLarge, originalPrice: 6.61)]),
            Drink(name: "Royal English Breakfast Tea", image: "englishTea", rate: 5.0, price: [PriceCup(size: .small, originalPrice: 3.61),
                                                                                    PriceCup(size: .medium, originalPrice: 4.61),
                                                                                    PriceCup(size: .large, originalPrice: 5.61),
                                                                                    PriceCup(size: .extraLarge, originalPrice: 6.61)]),
            Drink(name: "Hot Sweet Indonesian Tea", image: "indonesian", rate: 3.9, price: [PriceCup(size: .small, originalPrice: 3.61),
                                                                                 PriceCup(size: .medium, originalPrice: 4.61),
                                                                                 PriceCup(size: .large, originalPrice: 5.61),
                                                                                 PriceCup(size: .extraLarge, originalPrice: 6.61)]),
            Drink(name: "Chamomile Mint Blossom Tea", image: "camomille", rate: 3.2, price: [PriceCup(size: .small, originalPrice: 3.61),
                                                                                  PriceCup(size: .medium, originalPrice: 4.61),
                                                                                  PriceCup(size: .large, originalPrice: 5.61),
                                                                                  PriceCup(size: .extraLarge, originalPrice: 6.61)]),
        ]))
        
        return [coffee, tea]
    }
    
    func getDiscounts() -> [Discount] {
        [
            Discount(name: "Honey Citrus Mint Tea", discount: 0.2),
            Discount(name: "Caffè Americano", discount: 0.3)
        ]
    }
    
}
