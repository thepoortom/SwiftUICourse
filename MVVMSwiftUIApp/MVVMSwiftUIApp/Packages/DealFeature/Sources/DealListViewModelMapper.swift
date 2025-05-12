//
//  DealListViewModelMapper.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 10.05.2025.
//

import Repository
import UIComponents

final class DealListViewModelMapper {
    private let favoriteRepository: FavoriteRepository
    
    // MARK: Life cycle
    init(favoriteRepository: FavoriteRepository) {
        self.favoriteRepository = favoriteRepository
    }
}

extension DealListViewModelMapper {
    func makeViewModels(for deals: [Deal]) -> [DealWithFavoriteItemViewModel] {
        deals.map {
            .init(
                deal: .init(
                    id: $0.id,
                    title: $0.title,
                    salePrice: $0.salePrice,
                    normalPrice: $0.normalPrice
                ),
                isFavorite: favoriteRepository.isFavorite(dealID: $0.id)
            )
        }
    }
}
