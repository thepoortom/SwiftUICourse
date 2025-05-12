//
//  FavoriteRepository.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 10.05.2025.
//

import Combine

public protocol FavoriteRepository {
    var favoritesPublisher: Published<Set<String>>.Publisher { get }
    
    func add(_ dealID: String) async
    func remove(_ dealID: String) async
    func isFavorite(dealID: String) -> Bool
}

public final class InMemoryFavoriteRepository {
    @Published
    private var favorites: Set<String> = []
    
    public var favoritesPublisher: Published<Set<String>>.Publisher {
        $favorites
    }
    
    // MARK: Life cycle
    public init() {
    }
}

// MARK: - FavoriteRepository
extension InMemoryFavoriteRepository: FavoriteRepository {
    public func add(_ dealID: String) async {
        favorites.insert(dealID)
    }
    
    public func remove(_ dealID: String) async {
        favorites.remove(dealID)
    }
    
    public func isFavorite(dealID: String) -> Bool {
        favorites.contains(dealID)
    }
}
