//
//  FeaturedView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 05.01.2026.
//

import SwiftUI

struct FeaturedView: View {
    var image: Image
    var title: String
    var name: String
    var price: Double
    var rate: Double
    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading, spacing: 17) {
                //Image
                ZStack(alignment: .bottomTrailing) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 205, height: 126)
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                    Image(.order)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(17)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                        .offset(x: -10, y: 29)
                        .shadow(color: .black.opacity(0.2), radius: 10, y: 5)
                        .foregroundStyle(.oldPurple)
                }
                //Text
                VStack(alignment: .leading, spacing: 7) {
                    ContentTextView(text: title, font: .regular, size: 14)
                    ContentTextView(text: name, font: .semiBold, size: 16)
                        .multilineTextAlignment(.leading)
                }
                .frame(width: 142, alignment: .leading)
                
                //price
                HStack(alignment: .center, spacing: 12) {
                    ContentTextView(text: "$\(String(format: "%0.2f", price))", font: .semiBold, size: 18, color: .oldPurple)
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 5, height: 5)
                        .foregroundStyle(.chineseSilver)
                    HStack(spacing: 1) {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundStyle(.blackMist)
                        ContentTextView(text: "\(rate)", font: .regular, size: 18, color: .blackMist)
                    }
                }
            }
            .frame(width: 205, height: 263, alignment: .top)
        }
    }
}

#Preview {
    FeaturedView(image: Image(.americano), title: "Tea", name: "Hot Sweet Indonesian Tea", price: 3.61, rate: 4.0)
}
