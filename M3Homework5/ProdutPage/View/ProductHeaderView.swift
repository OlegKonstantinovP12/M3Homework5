//
//  ProductHeaderView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 11.01.2026.
//

import SwiftUI

struct ProductHeaderView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        HStack {
            Button {
                path.removeLast()
            } label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.black)
                    
            }
            .frame(width: 24, height: 24)
            Spacer()
            ContentTextView(text: "Products",font: .semiBold, size: 20, color: .black)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .rotationEffect(.degrees(90))
                    .foregroundStyle(.black)
            }
            .frame(width: 24, height: 24)

        }
        .padding(.leading, 23)
        .padding(.trailing, 34)
    }
}

#Preview {
    @Previewable @State var path: NavigationPath = NavigationPath()
    ProductHeaderView(path: $path)
}
