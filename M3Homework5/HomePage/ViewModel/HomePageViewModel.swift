//
//  HomePageViewModel.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import Combine


class HomePageViewModel: ObservableObject {
    @Published var menu: [Menu] = []
    //    var discountedMenu: [Menu] = []
    private let networkManager = NetworkManager()
    
    func getMenu() {
        let menu = networkManager.getData()
        let discount = networkManager.getDiscounts()
        self.menu = applyDiscount(menu: menu, discounts: discount)
        //        self.discountedMenu = applyDiscount(menu: menu, discounts: discount)
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
            discounted: true,
            description: drink.description,
            price: newPrices
        )
    }
    private func applyDiscount(menu: [Menu], discounts: [Discount]) -> [Menu] {
        menu.map { item in
            switch item.typeMenu {
            case .coffee(let drinks):
                let updatedDrink = drinks.map {calcDiscount(drink: $0, discounts: discounts)}
                return Menu(typeMenu: .coffee(updatedDrink))
                
            case .tea(let drinks):
                let updatedDrink = drinks.map {calcDiscount(drink: $0, discounts: discounts)}
                return Menu(typeMenu: .tea(updatedDrink))
            case .eat:
                return item
            }
        }
    }
    
    func getDiscountedDrinks(menu: [Menu]) -> [Drink] {
        menu.flatMap { item in
            switch item.typeMenu {
            case .coffee(let drinks),
                    .tea(let drinks):
                return drinks.filter { $0.discounted == true }
            case .eat:
                return []
            }
        }
    }
            
}
