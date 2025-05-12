//
//  FavoriteDealListFlowContainer.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 10.05.2025.
//

import FavoriteFeature
import Repository

final class FavoriteDealListFlowContainer {
    private let dealRepository: DealRepository
    private let favoriteRepository: FavoriteRepository
    
    // MARK: Life cycle
    init(
        dealRepository: DealRepository,
        favoriteRepository: FavoriteRepository
    ) {
        self.dealRepository = dealRepository
        self.favoriteRepository = favoriteRepository
    }
}

extension FavoriteDealListFlowContainer {
    func makeFavoriteDealListViewModel() -> FavoriteListViewModel {
        FavoriteListViewModel(
            dealRepository: dealRepository,
            favoriteRepository: favoriteRepository
        )
    }
}
