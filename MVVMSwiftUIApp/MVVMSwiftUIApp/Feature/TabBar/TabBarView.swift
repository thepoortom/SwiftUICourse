//
//  TabBarView.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 20.04.2025.
//

import DealFeature
import FavoriteFeature
import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var dependencyContainer: DependencyContainer
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    @State private var isPresented = false
    
    var body: some View {
        TabView {
            DealListView(
                viewModel: dependencyContainer
                    .makeDealListFlowContainer()
                    .makeDealListViewModel()
            )
            .tabItem {
                Label("Deals", systemImage: "list.dash")
            }
            
            FavoriteListView(
                viewModel: dependencyContainer
                    .makeFavoriteDealListFlowContainer()
                    .makeFavoriteDealListViewModel()
            )
            .tabItem {
                Label("Favorite", systemImage: "star.fill")
            }
        }
        .onAppear {
            if !hasSeenOnboarding {
                isPresented = true
            }
        }
        .fullScreenCover(isPresented: $isPresented) {
            OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
        }
    }
}
