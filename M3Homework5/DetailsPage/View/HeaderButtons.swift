//
//  HeaderButtons.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 05.01.2026.
//

import SwiftUI

struct HeaderButtons: View {
    @Binding var path: NavigationPath
    var body: some View {
        HStack {
            Button {
                path.removeLast()
            } label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.white)
            }
            Spacer()
            ContentTextView(text: "Details", font: .semiBold, size: 20, color: .white)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "bookmark")
                    .resizable()
                    .frame(width: 18, height: 22)
                    .foregroundStyle(.white)
            }


        }
        .padding(.leading,28)
        .padding(.trailing, 29)
        .padding(.top, 21)
    }
}

//#Preview {
//    HeaderButtons()
//}
