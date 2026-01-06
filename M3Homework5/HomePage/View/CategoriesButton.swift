//
//  CategoriesButton.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import SwiftUI

struct CategoriesButton: View {
    var image: Image
    var text: String
    var count: String
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 16) {
                image
                    .resizable()
                    .frame(width: 38, height: 38)
                    .foregroundStyle(.white)
                VStack(alignment: .leading, spacing: 4) {
                    ContentTextView(text: text, font: .semiBold, size: 16, color: .white)
                    ContentTextView(text: "\(count) Menus", font: .regular, size: 14, color: .peachJelly)
                }
            }
            .zIndex(1)
            
            image
                .resizable()
                .frame(width: 91, height: 91)
                .foregroundStyle(.englishViolet)
                .offset(x: 60, y: 50)
        }
        .frame(width: 149, height: 156)
        .background(.oldPurple)
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}

#Preview {
    CategoriesButton(image: Image(.cup), text: "Beverages", count: "67")
}
