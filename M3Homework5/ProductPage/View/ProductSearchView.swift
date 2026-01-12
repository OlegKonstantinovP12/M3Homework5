//
//  ProductSearchView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 11.01.2026.
//

import SwiftUI

struct ProductSearchView: View {
    @Binding var text: String
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                HStack(spacing: 13) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.kawaiiGrey)
                        .padding(.leading, 19)
                        .padding(.vertical, 18)
                    TextField("Search here..", text: $text)
                        .font(.custom(Poppins.regular.rawValue, size: 16))
                }
                    
                RoundedRectangle(cornerRadius: 22)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.paleSilver)
            }
            .frame(height: 60)
                
            Button {
                
            } label: {
                Image(.funnel)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 24)
                    .foregroundStyle(.oldPurple)
                    .padding(.vertical, 18)
                    .padding(.horizontal, 20)
                    .background(.paleSilver)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
            }

        }
        .padding(.leading, 23)
        .padding(.trailing, 34)
    }
}

#Preview {
    @Previewable @State var text: String = ""
    ProductSearchView(text: $text)
}
