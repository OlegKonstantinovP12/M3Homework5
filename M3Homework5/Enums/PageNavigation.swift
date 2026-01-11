//
//  PageNavigation.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 05.01.2026.
//

import Foundation

enum PageNavigation: Hashable {
    case details(drink: Drink)
    case product(drink: [Drink])
}
