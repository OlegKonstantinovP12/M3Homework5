//
//  QuantityButton.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 05.01.2026.
//

import SwiftUI

struct QuantityButton: View {
    @Binding var count: Int
    let minValue: Int = 1
    let maxValue: Int = 10
    var body: some View {
        HStack {
            Button {
                if count > minValue {
                    count -= 1
                }
            } label: {
                ContentTextView(text: "-", font: .semiBold, size: 20, color: count > minValue ? .oldPurple : .philippineGrey)
            }
            Spacer()
            Text("\(count)")
            Spacer()
            Button {
                if count < maxValue {
                    count += 1
                }
            } label: {
                ContentTextView(text: "+", font: .semiBold, size: 20, color: count < maxValue ? .oldPurple : .philippineGrey)
            }
        }
        .frame(width: 128)
        .padding(.vertical, 14)
        .padding(.horizontal, 19)
        .overlay {
            RoundedRectangle(cornerRadius: 22)
                .stroke(lineWidth: 1)
                .foregroundStyle(.chineseSilver)
        }
    }
}

#Preview {
    @Previewable @State var count: Int = 1
    QuantityButton(count: $count)
}
