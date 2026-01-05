//
//  HomePageView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var viewModel = HomePageViewModel()
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView(.vertical) {
                VStack(spacing: 30) {
                    //Header
                    HeaderView()
                    VStack(alignment: .center ,spacing: 25) {
                        //Promotion
                        HStack {
                            ContentTextView(text: "✨ Promotion", font: .medium, size: 18, color: .black)
                            Spacer()
                            Button {
                                //
                            } label: {
                                ContentTextView(text: "More", font: .medium, size: 16, color: .duskyPurple)
                            }
                        }
                        .padding(.leading, 28)
                        .padding(.trailing, 29)
                        ScrollView(.horizontal) {
                            HStack(spacing: 15) {
                                ForEach(viewModel.getDiscountedDrinks(menu: viewModel.menu)) { drink in
                                    if let cup = drink.price.first {
                                        PromotionView(name: drink.name, discountPrice: cup.discountPrice ?? cup.originalPrice, oldPrice: cup.originalPrice)
                                    }
                                }
                            }
                            .padding(.leading, 28)
                            .padding(.trailing, 28)
                            .onAppear {
                                viewModel.getMenu()
                                
                                
                            }
                        }
                        .scrollIndicators(.hidden)
                        //Categories
                        VStack(alignment: .leading) {
                            CategoriesView()
                        }
                        //Featured
                        VStack(alignment: .leading) {
                            HStack {
                                ContentTextView(text: "Featured Beverages", font: .medium, size: 18, color: .black)
                                Spacer()
                                Button {
                                    //
                                } label: {
                                    ContentTextView(text: "More", font: .medium, size: 16, color: .duskyPurple)
                                }
                            }
                            .padding(.leading, 28)
                            .padding(.trailing, 29)
                            ScrollView(.horizontal) {
                                
                                HStack {
                                    ForEach(viewModel.featuredDrinks) { item in
                                        Button {
                                            path.append(PageNavigation.details(drink: item))
                                        } label: {
                                            FeaturedView(image: Image(item.drink.image), title: item.category.rawValue, name: item.drink.name, price: item.drink.price.first!.originalPrice, rate: item.drink.rate)
                                        }
                                        
                                    }
                                }
                                .padding(.leading, 28)
                                .padding(.trailing, 29)
                                
                            }
                            
                        }
                        
                        
                    }
                }
            }
            .padding(.bottom, 60)
        }
        .navigationDestination(for: PageNavigation.self) { page in
            switch page {
            case .details(let drink):
                DetailsView(drink: drink, path: $path)
                
            }
        }
        
        
        
        
    }
}

#Preview {
    HomePageView()
}

