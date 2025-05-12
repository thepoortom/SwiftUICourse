//
//  DealWithFavoriteItemView.swift
//  UIComponents
//
//  Created by Lev Iakimov on 11.05.2025.
//

import SwiftUI

public struct DealWithFavoriteItemView: View {
    private let deal: DealWithFavoriteItemViewModel
    private var toggleFavoriteAction: () -> Void
    
    public init(
        deal: DealWithFavoriteItemViewModel,
        toggleFavoriteAction: @escaping () -> Void
    ) {
        self.deal = deal
        self.toggleFavoriteAction = toggleFavoriteAction
    }
    
    public var body: some View {
        HStack(alignment: .top) {
            Button(action: toggleFavoriteAction) {
                Image(systemName: deal.isFavorite ? "star.fill" : "star")
            }
            DealItemView(deal: deal.deal)
        }
    }
}

#Preview {
    DealWithFavoriteItemView(
        deal: .sample,
        toggleFavoriteAction: {
        }
    )
}
