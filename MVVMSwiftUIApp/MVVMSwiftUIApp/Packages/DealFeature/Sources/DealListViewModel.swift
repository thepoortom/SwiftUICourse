//
//  DealListViewModel.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 27.04.2025.
//

import Combine
import Network
import Repository
import UIComponents

public final class DealListViewModel: ObservableObject {
    enum ViewState {
        case empty
        case fetchingData
        case success
        case failed(underlyingError: Error)
    }
    
    @Published
    private(set) var state: ViewState = .empty
    @Published
    private(set) var deals: [DealWithFavoriteItemViewModel] = []
    private let store: DealStore = .steam
    
    private let dealNetworkService: DealNetworkService
    private let dealRepository: DealRepository
    private let favoriteRepository: FavoriteRepository
    private let viewModelMapper: DealListViewModelMapper
    
    // MARK: Life cycle
    public init(
        dealNetworkService: DealNetworkService,
        dealRepository: DealRepository,
        favoriteRepository: FavoriteRepository
    ) {
        self.dealNetworkService = dealNetworkService
        self.dealRepository = dealRepository
        self.favoriteRepository = favoriteRepository
        self.viewModelMapper = .init(favoriteRepository: favoriteRepository)
    }
}

extension DealListViewModel {
    func getStoreTitle() -> String {
        store.title
    }
    
    func fetchDeals() async {
        await MainActor.run {
            self.state = .fetchingData
        }
        
        let savedDeals = await dealRepository.getDeals()
            .map { Deal(entity: $0) }
        guard savedDeals.isEmpty else {
            await MainActor.run {
                self.deals = self.viewModelMapper.makeViewModels(for: savedDeals)
                self.state = .success
            }
            return
        }
        
        do {
            let fetchedDeals = try await dealNetworkService.fetchDeals(storeID: store.id)
                .map { Deal(entity: $0) }
            
            await MainActor.run {
                self.deals = self.viewModelMapper.makeViewModels(for: fetchedDeals)
                self.state = .success
            }
            
            try await dealRepository.saveDeals(fetchedDeals.map { Repository.Deal(entity: $0) })
            
        } catch {
            await MainActor.run {
                self.state = .failed(underlyingError: error)
            }
        }
    }
    
    func toggleFavorite(for deal: DealWithFavoriteItemViewModel) async {
        let id = deal.deal.id
        if deal.isFavorite {
            await favoriteRepository.remove(id)
        } else {
            await favoriteRepository.add(id)
        }
        
        await refreshDeals()
    }
    
    func refreshDeals() async {
        let savedDeals = await dealRepository.getDeals()
            .map { Deal(entity: $0) }
        
        await MainActor.run {
            self.deals = viewModelMapper.makeViewModels(for: savedDeals)
        }
    }
}
