//
//  ProductPageViewModel.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 11.01.2026.
//

import Combine

class ProductPageViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var selected: DrinkByType = .coffee
}
