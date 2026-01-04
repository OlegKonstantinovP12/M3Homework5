//
//  PromotionView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import SwiftUI

struct PromotionView: View {
    var name: String
    var discountPrice: Double
    var oldPrice: Double
    var body: some View {
            VStack(alignment: .leading, spacing: 15) {
                ContentTextView(text: name, font: .semiBold, size: 18, color: .white)
                    .frame(width: 175)
                    
                HStack {
                    ContentTextView(text: "\(String(format: "%0.2f", discountPrice))", font: .semiBold, size: 24, color: .white)
                    ContentTextView(text: "\(String(format: "%0.2f", oldPrice))", font: .semiBold, size: 18, color: .peachJelly)
                        .strikethrough()
                    Spacer()
                    Image(.equal)
                        .resizable()
                        .frame(width: 21, height: 11)
                        .foregroundStyle(.peachJelly)
                }
            }
            .padding(.leading, 24)
            .padding(.trailing, 34)
            .frame(width: 320, height: 187)
            .background(.englishViolet)
            .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}

#Preview {
    PromotionView(name: "Honey Citrus Mint Tea", discountPrice: 6.7, oldPrice: 9.5)
}
