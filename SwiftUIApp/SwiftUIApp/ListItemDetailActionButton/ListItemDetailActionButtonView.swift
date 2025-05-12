//
//  ListItemDetailActionButtonView.swift
//  SwiftUIApp
//
//  Created by Lev Iakimov on 05.03.2025.
//

import SwiftUI

struct ListItemDetailActionButtonView: View {
    @EnvironmentObject var tabBarViewModel: TabBarViewModel
    @EnvironmentObject var contentListViewModel: ContentListViewModel
    
    var body: some View {
        Button {
            tabBarViewModel.selectTab(.list)
            contentListViewModel.selectRandomItem()
        } label: {
            Label(
                "Show random item",
                systemImage: "questionmark.circle"
            )
        }

    }
}

#Preview {
    ListItemDetailActionButtonView()
}
