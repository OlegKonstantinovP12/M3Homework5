//
//  TabViewButton.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import SwiftUI

struct TabViewButton: View {
    var item: PageType
    @Binding var selected: PageType
    
    var body: some View {
        VStack {
            
            Button {
                selected = item
            } label: {
                ZStack {
                    Image(item.rawValue)
                        .resizable()
                        .frame(width: 24, height: 24)
                        
                    if item == selected {
                        Capsule()
                            .frame(width: 8, height: 10)
                            .clipShape(Rectangle().offset(x: 0, y: -5))
                            .offset(y: 33)
                    }
                    
                }
                .foregroundStyle(item == selected ? .oldPurple : .grayX11)
                
            }
        }
        .frame(width: 89, height: 67)
        

    }
}

#Preview {
    TabViewButton(item: PageType.home, selected: MainPageView().$selectedPage)
}


