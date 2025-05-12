//
//  TabBarViewModel.swift
//  SwiftUIApp
//
//  Created by Lev Iakimov on 09.03.2025.
//

import Foundation

final class TabBarViewModel: ObservableObject {
    @Published var selectedTab: TabItem = .list
}

extension TabBarViewModel {
    func selectTab(_ tab: TabItem) {
        self.selectedTab = tab
    }
}
