//
//  ContentView.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 03.01.2026.
//

import SwiftUI

struct MainPageView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var selectedPage: PageType = .home
    var pages: [PageType] = [.home, .order, .invoice, .settings]
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectedPage) {
                HomePageView()
                    .tag(PageType.home)
                Text("Order")
                    .tag(PageType.order)
                Text("Invoice")
                    .tag(PageType.invoice)
                Text("Settings")
                    .tag(PageType.settings)
            }
            HStack(spacing: 20) {
                ForEach(pages, id: \.self) { page in
                    TabViewButton(item: page, selected: $selectedPage)
                }
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .padding(.bottom, 1)
        }
    }
}

#Preview {
    MainPageView()
}


