//
//  HomePageViewModel.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import Combine


class HomePageViewModel: ObservableObject {
    @Published var menu: [Menu] = []
    @Published var featuredDrinks: [Drink] = []
    private let networkManager = NetworkManager()
    
    func getMenu() {
        let menu = networkManager.getData()
        let discount = networkManager.getDiscounts()
        self.menu = applyDiscount(menu: menu, discounts: discount)
        getFeaturedDrink(menu: menu)
       
    }
    
    func getCountPosition(menu: Menu) -> Int {
        switch menu.typeMenu {
        case .beverages(let drinks):
           return drinks.count
        case .food(let foods):
            if !foods.isEmpty {
                return foods.count
            } else {
                return 0
            }
        }
    }
    
    func getFeaturedDrink(menu: [Menu]) {
        featuredDrinks = getRandomDrinks(menu: menu)
    }
    
    private func calcDiscount(drink: Drink, discounts: [Discount]) -> Drink {
        guard let discount = discounts.first(where: { $0.name == drink.name}) else { return drink }
        
        let newPrices = drink.price.map { cup in
            PriceCup(size: cup.size, originalPrice: cup.originalPrice,discountPrice: cup.originalPrice * (1 - discount.discount))
        }
        
        return Drink(
            name: drink.name,
            image: drink.image,
            rate: drink.rate,
            description: drink.description,
            discounted: true,
            price: newPrices,
            category: drink.category
        )
    }
    private func applyDiscount(menu: [Menu], discounts: [Discount]) -> [Menu] {
        menu.map { item in
            switch item.typeMenu {
            case .beverages(let drinks):
                let updatedDrink = drinks.map {calcDiscount(drink: $0, discounts: discounts)}
                return Menu(typeMenu: .beverages(updatedDrink))
            case .food( _):
                return item
            }
        }
    }
    
    func getDiscountedDrinks(menu: [Menu]) -> [Drink] {
        menu.flatMap { item in
            switch item.typeMenu {
            case .beverages(let drinks):
                return drinks.filter { $0.discounted }
            case .food( _):
                return []
            }
        }
    }
    
    private func getRandomDrinks(menu: [Menu], count: Int = 4) -> [Drink] {
        let allDrinks = menu.flatMap { item in
            switch item.typeMenu {
            case .beverages(let drinks):
                return drinks
            case .food( _):
                return []
            }
        }
        return Array(allDrinks.shuffled().prefix(count))
    }
            
    func drinks(menu: Menu) -> [Drink] {
        switch menu.typeMenu {
        case .beverages(let drinks):
            return drinks
        case .food( _):
            return []
        }
    }
}
