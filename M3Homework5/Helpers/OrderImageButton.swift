//
//  OrderImageButton.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 11.01.2026.
//

import SwiftUI

struct OrderImageButton: View {
    var body: some View {
        Image(.order)
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .padding(17)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 22))
            .shadow(color: .black.opacity(0.2), radius: 10, y: 5)
            .foregroundStyle(.oldPurple)
    }
}

#Preview {
    OrderImageButton()
}
