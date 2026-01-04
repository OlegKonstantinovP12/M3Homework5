//
//  CategoriesView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ContentTextView(text: "Categories", font: .medium, size: 18, color: .black)
//                .padding(.leading, 29)
//                .padding(.trailing, 28)
            HStack(spacing: 15) {
                CategoriesButton(image: Image(.cup), text: "Beverages", count: "67")
                CategoriesButton(image: Image(.burger), text: "Foods", count: "23")
            }
//            .padding(.leading, 29)
//            .padding(.trailing, 28)
        }
    }
}

#Preview {
    CategoriesView()
}
