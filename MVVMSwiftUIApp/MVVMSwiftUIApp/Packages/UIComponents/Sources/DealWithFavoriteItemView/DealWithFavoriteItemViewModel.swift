//
//  DealWithFavoriteItemViewModel.swift
//  UIComponents
//
//  Created by Lev Iakimov on 11.05.2025.
//

public struct DealWithFavoriteItemViewModel: Identifiable {
    public var id: String { deal.id }
    
    public let deal: DealItemViewModel
    public let isFavorite: Bool
    
    // MARK: Life cycle
    public init(
        deal: DealItemViewModel,
        isFavorite: Bool
    ) {
        self.deal = deal
        self.isFavorite = isFavorite
    }
}

extension DealWithFavoriteItemViewModel {
    static var sample: Self {
        .init(
            deal: .sample,
            isFavorite: false
        )
    }
}
