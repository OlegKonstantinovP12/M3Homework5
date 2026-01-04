//
//  ContentTextView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import SwiftUI

struct ContentTextView: View {
    var text: String
    var font: Poppins = .regular
    var size: CGFloat
    var color: Color = .attractiveBlack
    var body: some View {
        Text(text)
            .poppins(font, size: size)
            .foregroundStyle(color)
        
    }
}

#Preview {
    ContentTextView(text: "Good Morning", font: .regular, size: 40)
}
