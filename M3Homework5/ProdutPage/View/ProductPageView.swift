//
//  ProductPageView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 11.01.2026.
//

import SwiftUI

struct ProductPageView: View {
    @Binding var path: NavigationPath
    @StateObject var viewModel = ProductPageViewModel()
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var drink: [Drink]
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 21) {
                ProductHeaderView(path: $path)
                ProductSearchView(text: $viewModel.text)
            }
            .background(.white)
            .padding(.bottom, 10)
            .zIndex(1)
            
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(DrinkByType.allCases, id:\.self) { items in
                            Button {
                                withAnimation {
                                    viewModel.selected = items
                                    proxy.scrollTo(items.rawValue, anchor: .top)
                                }
                            } label: {
                                VStack(spacing: 13) {
                                    ContentTextView(text: items.rawValue, font: .medium, size: 18, color: .oldPurple)
                                    if items == viewModel.selected {
                                        Circle()
                                            .frame(width: 10, height: 10)
                                            .foregroundStyle(.peachJelly)
                                    }
                                        
                                }
                                .frame(height: 50, alignment: .top)
                                
                                
                            }
                        }
                    }
                    
                }
                .safeAreaPadding(.leading, 22)
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(drink) { item in
                            Button {
                                path.append(PageNavigation.details(drink: item))
                            } label: {
                                ItemGridView(image: Image(item.image), name: item.name, category: item.category.rawValue, price: item.price.first!.originalPrice)
                                    .id(item.category.rawValue)
                            }
                        }
                    }
                    
                }
                
            }
            .padding(.top, 135)
            

        }
        .toolbar(.hidden)
        
    }
}



#Preview {
    @Previewable @State var path = NavigationPath()
    @Previewable @State var text: String = ""
    ProductPageView(path: $path, drink: [Drink(name: "Hot matcha", image: "", rate: 4.0, description: "", price: [PriceCup(size: .small, originalPrice: 4.0)], category: .coffee)])
}
