//
//  TabBarView.swift
//  SwiftUIApp
//
//  Created by Lev Iakimov on 05.03.2025.
//

import SwiftUI

struct TabBarView: View {
    @StateObject private var viewModel = TabBarViewModel()
    @StateObject private var contentListViewModel = ContentListViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            ListItemDetailActionButtonView()
                .tag(TabItem.toDetails)
                .tabItem {
                    Label("To Details", systemImage: "arrow.up.right")
                }
            
            ContentListView(viewModel: contentListViewModel)
                .tag(TabItem.list)
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
            
            ModalActionButtonView()
                .tag(TabItem.toModal)
                .tabItem {
                    Label("To Modal", systemImage: "envelope.open")
                }
        }
        .environmentObject(viewModel)
        .environmentObject(contentListViewModel)
    }
}

#Preview {
    TabBarView()
}
