//
//  HomePageView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var viewModel = HomePageViewModel()
    @Binding var path: NavigationPath
    
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
                            HStack(spacing: 1) {
                                ForEach(viewModel.getDiscountedDrinks(menu: viewModel.menu)) { drink in
                                    if let cup = drink.price.first {
                                        PromotionView(name: drink.name, discountPrice: cup.discountPrice ?? cup.originalPrice, oldPrice: cup.originalPrice)
                                            .scrollTransition { content, phase in
                                                content
                                                    .opacity(phase.isIdentity ? 1 : 0.5)
                                                    .scaleEffect(phase.isIdentity ? 1 : 0.8)
                                            }
                                    }
                                }
                            }
                            .padding(.leading, 28)
                            .padding(.trailing, 28)
                            .scrollTargetLayout()
                        }
                        .scrollIndicators(.hidden)
                        .scrollTargetBehavior(.viewAligned)
                        //Categories
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading, spacing: 20) {
                                ContentTextView(text: "Categories", font: .medium, size: 18, color: .black)
                                HStack(spacing: 15) {
                                    ForEach(viewModel.menu) { item in
                                        Button {
                                            path.append(PageNavigation.product(drink: viewModel.drinks(menu: item)))
                                        } label: {
                                            CategoriesView(image: Image(.cup), text: "Beverage", count: viewModel.getCountPosition(menu: item))
                                            
                                        }
                                    }
                                        }
                                        
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 28)
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
                                            FeaturedView(image: Image(item.image), title: item.category.rawValue, name: item.name, price: item.price.first!.originalPrice, rate: item.rate)
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
            .navigationDestination(for: PageNavigation.self) { page in
                switch page {
                case .details(let drink):
                    DetailsView(drink: drink, path: $path)
                case .product(let drinks):
                    ProductPageView(path: $path, drink: drinks)
                }
            }
        }
        .onAppear {
            viewModel.getMenu()
        }
    }
}

#Preview {
    @Previewable @State var path: NavigationPath = NavigationPath()
    HomePageView( path: $path)
}

