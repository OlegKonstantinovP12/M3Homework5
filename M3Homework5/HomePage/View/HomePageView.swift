//
//  HomePageView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var viewModel = HomePageViewModel()
    var body: some View {
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
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(viewModel.getDiscountedDrinks(menu: viewModel.menu)) { drink in
                                if let cup = drink.price.first {
                                    PromotionView(name: drink.name, discountPrice: cup.discountPrice ?? cup.originalPrice, oldPrice: cup.originalPrice)
                                }
                            }
                        }
                        .padding(.leading, 28)
                        .onAppear {
                            viewModel.getMenu()
                            
                        }
                    }
                    CategoriesView()
                }
                
                
            }
            
        }
        
        
        //Categories
        //Featured
    }
}

#Preview {
    HomePageView()
}

/*
 [M3Homework5.Drink(id: "353AE42A-3D5F-47D2-B8F8-622843150CB1", name: "Caffè Americano", image: "americano", rate: 3.8, discounted: Optional(true), description: nil, price: [M3Homework5.PriceCup(id: "DDC14442-CCB8-4A4E-9C3F-B2319CE2456F", size: M3Homework5.CupSize.small, originalPrice: 3.61, discountPrice: Optional(2.5269999999999997)), M3Homework5.PriceCup(id: "C9091888-E9A9-42C0-8BA4-4EFBE57FC5EC", size: M3Homework5.CupSize.medium, originalPrice: 4.61, discountPrice: Optional(3.227)), M3Homework5.PriceCup(id: "36173748-F85D-4178-AD7A-799C341CC470", size: M3Homework5.CupSize.large, originalPrice: 5.61, discountPrice: Optional(3.927)), M3Homework5.PriceCup(id: "83D55460-928D-4D2B-A4D1-B9C1EBF3AA05", size: M3Homework5.CupSize.extraLarge, originalPrice: 6.61, discountPrice: Optional(4.627))]),
 M3Homework5.Drink(id: "DC185D59-DFA1-4527-8D31-02A8AF0B9340", name: "Honey Citrus Mint Tea", image: "mintTea", rate: 2.3, discounted: Optional(true), description: nil, price: [M3Homework5.PriceCup(id: "A682ADD2-1547-4C34-99D4-0D55AD6EF5A3", size: M3Homework5.CupSize.small, originalPrice: 3.61, discountPrice: Optional(2.888)), M3Homework5.PriceCup(id: "11B8FD52-DC08-455B-8FAC-A380B53E2314", size: M3Homework5.CupSize.medium, originalPrice: 4.61, discountPrice: Optional(3.6880000000000006)), M3Homework5.PriceCup(id: "A8EECF0F-5263-4411-A150-057C05C709DD", size: M3Homework5.CupSize.large, originalPrice: 5.61, discountPrice: Optional(4.488)), M3Homework5.PriceCup(id: "7D5FE4AD-4A26-43F9-9750-833387635F74", size: M3Homework5.CupSize.extraLarge, originalPrice: 6.61, discountPrice: Optional(5.288))])]
 */
