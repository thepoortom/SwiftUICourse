//
//  InMemoryFavoriteRepository.swift
//  Repository
//
//  Created by Lev Iakimov on 14.06.2025.
//

import Combine

public final class InMemoryFavoriteRepository {
    @Published
    private var favorites: Set<String> = []
    
    public var favoritesPublisher: AnyPublisher<Set<String>, Never> {
        $favorites.eraseToAnyPublisher()
    }
    
    // MARK: Life cycle
    public init() {
    }
}

// MARK: - FavoriteRepository
extension InMemoryFavoriteRepository: FavoriteRepository {
    public func add(_ dealID: String) async throws {
        favorites.insert(dealID)
    }
    
    public func remove(_ dealID: String) async throws {
        favorites.remove(dealID)
    }
    
    public func isFavorite(dealID: String) -> Bool {
        favorites.contains(dealID)
    }
}
