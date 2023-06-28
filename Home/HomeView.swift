//
//  HomeView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/31.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var selectedTab: String
    
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LocalShopView()
                .tag("Local")
            PostedShopView()
                .tag("Posted")
            SurgeShopView()
                .tag("Surge")
            HistoryView()
                .tag("History")
            SearchVeiw()
                .tag("Search")
        }
    }
}


