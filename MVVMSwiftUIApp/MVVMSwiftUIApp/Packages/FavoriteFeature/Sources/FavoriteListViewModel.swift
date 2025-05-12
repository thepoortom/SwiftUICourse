//
//  FavoriteListViewModel.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 10.05.2025.
//

import Combine
import Foundation
import Repository
import UIComponents

public final class FavoriteListViewModel: ObservableObject {
    enum ViewState {
        case empty
        case list([DealItemViewModel])
    }
    
    @Published
    private(set) var state: ViewState = .empty
    
    private let dealRepository: DealRepository
    private let favoriteRepository: FavoriteRepository
    private let viewModelMapper: FavoriteDealListViewModelMapper
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Life cycle
    public init(
        dealRepository: DealRepository,
        favoriteRepository: FavoriteRepository
    ) {
        self.dealRepository = dealRepository
        self.favoriteRepository = favoriteRepository
        self.viewModelMapper = .init()
        setupSubscriptions()
    }
}

private extension FavoriteListViewModel {
    func setupSubscriptions() {
        Publishers
            .CombineLatest(
                dealRepository.dealsPublisher,
                favoriteRepository.favoritesPublisher
            )
            .receive(on: DispatchQueue.main)
            .sink { [weak self] deals, favoriteIDs in
                guard let self else { return }
                self.updateState(
                    deals: deals.map { .init(entity: $0) },
                    favoriteIDs: favoriteIDs
                )
            }
            .store(in: &cancellables)
    }
    
    func updateState(deals: [Deal], favoriteIDs: Set<String>) {
        let favoriteDeals = deals
            .filter { favoriteIDs.contains($0.id) }
        if favoriteDeals.isEmpty {
            state = .empty
        } else {
            state = .list(viewModelMapper.makeViewModels(for: favoriteDeals))
        }
    }
}
