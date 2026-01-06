//
//  DetailsView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 05.01.2026.
//

import SwiftUI

struct DetailsView: View {
    var drink: Drink
    @State var selected: CupSize = .small
    @State var count: Int = 1
    @Binding var path: NavigationPath
    init(drink: Drink, path: Binding<NavigationPath>) {
        self.drink = drink
        self._path = path
    }

    private var finalPrice: Double {
        price * Double(count)
    }
    private var price: Double {
        drink.price.first(where: { $0.size == selected })? .originalPrice ?? 0
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            HeaderButtons(path: $path)
                .padding(.leading,28)
                .padding(.trailing, 29)
                .padding(.top, 21)
                .padding(.bottom, 20)
                .background(.black.opacity(0.2))
                .zIndex(1)
            
            ScrollView {
                VStack(spacing: 38) {
                    //Image unit
                        Image(drink.image)
                            .resizable()
                            .scaledToFill()
                            .containerRelativeFrame(.horizontal)
                            .frame(maxWidth: .infinity)
                            .frame(height: 323)
                            .clipped()
        
        
                    //Text unit
                    VStack {
                        VStack(spacing: 16) {
                            ContentTextView(text: drink.name, font: .semiBold, size: 18, color: .attractiveBlack)
                                ContentTextView(text: drink.description, font: .regular, size: 14, color: .heatherGrey)
                        }
                        .padding(.leading, 27)
                        .padding(.trailing, 29)
                        
                        VStack(spacing: 30) {
                            HStack(spacing: 10) {
                                ForEach(drink.price) { item in
        
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
            .ignoresSafeArea(edges: .top)
        }
        .toolbar(.hidden)

    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
DetailsView(drink: Drink(name: "Hot Sweet Indonesian Tea", image: "indonesian", rate: 3.9, description: "Сладкий чёрный чай с пряными индонезийскими специями. Тёплый, ароматный напиток с нотками тропиков. Создан для уютных вечеров.", price: [PriceCup(size: .small, originalPrice: 4.35),
                                                                                                                                                                                                                                                  PriceCup(size: .medium, originalPrice: 5.35),
                                                                                                                                                                                                                                                  PriceCup(size: .large, originalPrice: 6.35),
                                                                                                                                                                                                                                                  PriceCup(size: .extraLarge, originalPrice: 7.35)]), path: $path)

}
