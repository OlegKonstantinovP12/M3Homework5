//
//  HeaderView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                ContentTextView(text: "Good Morning!", size: 16)
                ContentTextView(text: "Kevin Hard", font: .semiBold, size: 28)
            }
            Spacer()
                
                ZStack(alignment: .topTrailing) {
                    Image(.avatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Circle()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(.peachJelly)
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                        }
                        .offset(x: 5, y: -1)
                }
                .padding(.trailing, 5)
                .padding(.top, 1)
            }
        .padding(.horizontal, 28)
    }
}

#Preview {
    HeaderView()
}
