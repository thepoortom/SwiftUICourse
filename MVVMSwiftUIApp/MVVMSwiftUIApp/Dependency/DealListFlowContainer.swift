//
//  DealListFlowContainer.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 27.04.2025.
//

import DealFeature
import Network
import Repository

final class DealListFlowContainer {
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

extension DealListFlowContainer {
    func makeDealListViewModel() -> DealListViewModel {
        DealListViewModel(
            dealNetworkService: dealNetworkService,
            dealRepository: dealRepository,
            favoriteRepository: favoriteRepository
        )
    }
}
