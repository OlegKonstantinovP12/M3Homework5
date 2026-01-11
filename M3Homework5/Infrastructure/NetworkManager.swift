//
//  NetworkManager.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import Foundation
//["Hot Mocha Cappuccino Latte", "Caffè Americano", "Cappuccino", "Peppermint White Chocolate Mocha", "Honey Citrus Mint Tea", "Royal English Breakfast Tea", "Hot Sweet Indonesian Tea", "Chamomile Mint Blossom Tea"]
class NetworkManager {
    func getData() -> [Menu] {
        let beverages = [
            Drink(name: "Hot Mocha Cappuccino Latte", image: "cappuccinoLatte", rate: 4.0, description: "Классическое сочетание эспрессо и шоколада в нежной молочной пенке. Насыщенный вкус какао с мягкой кофейной горчинкой согреет в любой день. Идеально для любителей сладкого кофе.", price: [
                                                                                        PriceCup(size: .small, originalPrice: 3.26),
                                                                                        PriceCup(size: .medium, originalPrice: 4.26),
                                                                                        PriceCup(size: .large, originalPrice: 5.26),
                                                                                        PriceCup(size: .extraLarge, originalPrice: 6.61)], category: .coffee, coffeeCategory: .brewed),
            Drink(name: "Caffè Americano", image: "americano", rate: 3.8, description: "Крепкий эспрессо, разведённый горячей водой для мягкого вкуса. Чистый кофейный аромат без лишней сладости и молока. Выбор для тех, кто ценит классику.", price: [PriceCup(size: .small, originalPrice: 3.65),
                                                                       PriceCup(size: .medium, originalPrice: 4.65),
                                                                       PriceCup(size: .large, originalPrice: 5.65),
                                                                                                                                                                                                                                                         PriceCup(size: .extraLarge, originalPrice: 6.65)], category: .coffee, coffeeCategory: .blended),
            Drink(name: "Cappuccino", image: "cappuccino", rate: 5.0, description: "Эспрессо с горячим молоком и густой воздушной пенкой сверху. Баланс крепости кофе и сливочной нежности. Традиционный итальянский утренний напиток.", price: [PriceCup(size: .small, originalPrice: 3.84),
                                                                   PriceCup(size: .medium, originalPrice: 4.84),
                                                                   PriceCup(size: .large, originalPrice: 5.84),
                                                                                                                                                                                                                                                 PriceCup(size: .extraLarge, originalPrice: 6.84)], category: .coffee, coffeeCategory: .brewed),
            Drink(name: "Peppermint White Chocolate Mocha", image: "chocolateMocha", rate: 3.9, description: "Белый шоколад с мятой и эспрессо создают освежающий десерт в чашке. Сладость шоколада оттеняется прохладой мяты. Зимний хит для гурманов.", price: [PriceCup(size: .small, originalPrice: 3.85),
                                                                                             PriceCup(size: .medium, originalPrice: 4.85),
                                                                                             PriceCup(size: .large, originalPrice: 5.85),
                                                                                                                                                                                                                                                                  PriceCup(size: .extraLarge, originalPrice: 6.85)], category: .coffee, coffeeCategory: .brewed),
            Drink(name: "Honey Citrus Mint Tea", image: "mintTea", rate: 2.3, description: "Медовые нотки с цитрусовой свежестью и ароматной мятой. Натуральный иммуностимулятор с согревающим эффектом. Отличный выбор для простуды.", price: [PriceCup(size: .small, originalPrice: 4.00),
                                                                           PriceCup(size: .medium, originalPrice: 5.00),
                                                                           PriceCup(size: .large, originalPrice: 6.00),
                                                                                                                                                                                                                                                PriceCup(size: .extraLarge, originalPrice: 7.00)], category: .tea),
            Drink(name: "Royal English Breakfast Tea", image: "englishTea", rate: 5.0, description: "Классический английский чёрный чай крепкой заварки. Традиционный напиток для бодрого утра с молоком или сахаром. Королевский вкус с богатой историей.", price: [PriceCup(size: .small, originalPrice: 4.32),
                                                                                    PriceCup(size: .medium, originalPrice: 5.32),
                                                                                    PriceCup(size: .large, originalPrice: 6.32),
                                                                                                                                                                                                                                                                     PriceCup(size: .extraLarge, originalPrice: 7.32)], category: .tea),
            Drink(name: "Hot Sweet Indonesian Tea", image: "indonesian", rate: 3.9, description: "Сладкий чёрный чай с пряными индонезийскими специями. Тёплый, ароматный напиток с нотками тропиков. Создан для уютных вечеров.", price: [PriceCup(size: .small, originalPrice: 4.35),
                                                                                 PriceCup(size: .medium, originalPrice: 5.35),
                                                                                 PriceCup(size: .large, originalPrice: 6.35),
                                                                                                                                                                                                                                           PriceCup(size: .extraLarge, originalPrice: 7.35)], category: .tea),
            Drink(name: "Chamomile Mint Blossom Tea", image: "camomille", rate: 3.2, description: "Ромашка успокаивает, мята освежает, цветочные нотки дополняют вкус. Травяной чай для релакса после долгого дня. Натуральное средство от стресса.", price: [PriceCup(size: .small, originalPrice: 3.61),
                                                                                  PriceCup(size: .medium, originalPrice: 4.61),
                                                                                  PriceCup(size: .large, originalPrice: 5.61),
                                                                                                                                                                                                                                                              PriceCup(size: .extraLarge, originalPrice: 6.61)], category: .tea),
            ]
//        let food = [Food()]

        
        return [Menu(typeMenu: .beverages(beverages))]
    }
    
    func getDiscounts() -> [Discount] {
        [
            Discount(name: "Honey Citrus Mint Tea", discount: 0.2),
            Discount(name: "Caffè Americano", discount: 0.3)
        ]
    }
    
}


