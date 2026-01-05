//
//  DetailsView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 05.01.2026.
//

import SwiftUI

struct DetailsView: View {
    var drink: FeaturedDrink
    @Binding var path: NavigationPath
    init(drink: FeaturedDrink, path: Binding<NavigationPath>) {
        self.drink = drink
        self._path = path
    }
    @State var selected: CupSize = .small
    @State var count: Int = 1
    private var finalPrice: Double {
        price * Double(count)
    }
    private var price: Double {
        drink.drink.price.first(where: { $0.size == selected })? .originalPrice ?? 0
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            HeaderButtons(path: $path)
                .zIndex(1)
            ScrollView {
                VStack(spacing: 38) {
                    //Image unit

                    ZStack(alignment: .top) {
                        Image(drink.drink.image)
                            .resizable()
                            .ignoresSafeArea()
                            .scaledToFill()
                            .frame(height: 323)
                            
                        
                        
                    }
                    //Text unit
                    VStack {
                        VStack(spacing: 16) {
                            ContentTextView(text: drink.drink.name, font: .semiBold, size: 18, color: .attractiveBlack)
                            ContentTextView(text: drink.drink.description ?? "", font: .regular, size: 14, color: .heatherGrey)
                        }
                        .padding(.leading, 27)
                        .padding(.trailing, 29)
                        VStack(spacing: 30) {
                            HStack(spacing: 10) {
                                ForEach(drink.drink.price) { item in
                                    
                                    Button {
                                        selected = item.size
                                        
                                    } label: {
                                        HStack {
                                            Text(item.size.rawValue)
                                        }
                                        .frame(width: 64, height: 64)
                                        .foregroundStyle(.black)
                                        .background(selected == item.size ? .peachJelly : .moonlightSerenade)
                                        .clipShape(RoundedRectangle(cornerRadius: 22))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 22)
                                                .stroke(lineWidth: 1)
                                                .foregroundStyle(.peachJelly)
                                        }
                                        
                                    }
                                }
                            }
                            HStack(alignment: .bottom) {
                                Image(.priceTag)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(.oldPurple)
                                    ContentTextView(text: String(format: "%.2f", price), font: .medium, size: 24, color: .oldPurple)
                                Spacer()
                                
                                QuantityButton(count: $count)
                            }
                            .padding(.horizontal, 27)
                            VStack(spacing: 24) {
                                ContentTextView(text: "*)Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore", font: .light, size: 12, color: .heatherGrey)
                                Button {
                                    
                                } label: {
                                    HStack{
                                        ContentTextView(text: "Place order",font: .semiBold, size: 16, color: .white)
                                        ContentTextView(text: "$\(finalPrice)", font: .semiBold, size: 16, color: .white.opacity(0.37))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 18)
                                    .background(.oldPurple)
                                    .clipShape(RoundedRectangle(cornerRadius: 22))
                                }

                            }
                            .padding(.leading, 31)
                            .padding(.trailing, 26)
                            
                            
                        }
                    }
                    .padding(.top, 30)
                    
                }
            }
            .ignoresSafeArea()
        }
        
    }
}

//#Preview {
//    DetailsView(drink: FeaturedDrink(drink: Drink(name: "Honey Citrus Mint Tea", image: "mintTea", rate: 2.3, description: "“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim venia”", price: [PriceCup(size: .small, originalPrice: 4.00),
//                                                                                                                      PriceCup(size: .medium, originalPrice: 5.00),
//                                                                                                                      PriceCup(size: .large, originalPrice: 6.00),
//                                                                                                                      PriceCup(size: .extraLarge, originalPrice: 7.00)]), category: .tea))
//}
