//
//  CategoriesView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import SwiftUI

struct CategoriesView: View {
    var image: Image
    var text: String
    var count: Int
    var body: some View {
            
                CategoriesButton(image: image, text: text, count: "\(count)")
//                CategoriesButton(image: Image(.burger), text: "Foods", count: "23")
        
    }
}

#Preview {
    CategoriesView(image: Image(.cup), text: "Beverages", count: 67)
}
