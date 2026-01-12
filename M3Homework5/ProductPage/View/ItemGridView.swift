//
//  ItemGridView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 11.01.2026.
//

import SwiftUI

struct ItemGridView: View {
    var image: Image
    var name: String
    var category: String
    var price: Double
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .bottomTrailing) {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 149, height: 165)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                Button {
                    
                } label: {
                    OrderImageButton()
                }
            }
            ContentTextView(text: name, font: .semiBold, size: 16, color: .attractiveBlack)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(height: 48)
            ContentTextView(text: category, font: .regular, size: 14, color: .oldPurple)
            
            HStack(spacing: 12) {
                Image(.priceTag)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.oldPurple)
                ContentTextView(text: "$\(price)", font: .medium, size: 18, color: .oldPurple)
            }
        }
        .frame(width: 149, height: 291)
    }
}

#Preview {
    ItemGridView(image: Image(.americano), name: "White Cream Cappuccino", category: "Coffee", price: 4.6)
}
