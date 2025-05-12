//
//  DependencyContainer.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 27.04.2025.
//

import Combine
import Network
import Repository

final class DependencyContainer: ObservableObject {
    private let dealNetworkService: DealNetworkService
    private let dealRepository: DealRepository
    private let favoriteRepository: FavoriteRepository
    
    // MARK: Life cycle
    init(
        dealNetworkService: DealNetworkService,
        dealRepository: DealRepository,
        favoriteRepository: FavoriteRepository
    ) {
        self.dealNetworkService = dealNetworkService
        self.dealRepository = dealRepository
        self.favoriteRepository = favoriteRepository
    }
}

extension DependencyContainer {
    func makeDealListFlowContainer() -> DealListFlowContainer {
        .init(
            dealNetworkService: dealNetworkService,
            dealRepository: dealRepository,
            favoriteRepository: favoriteRepository
        )
    }
    
    func makeFavoriteDealListFlowContainer() -> FavoriteDealListFlowContainer {
        .init(
            dealRepository: dealRepository,
            favoriteRepository: favoriteRepository
        )
    }
}
