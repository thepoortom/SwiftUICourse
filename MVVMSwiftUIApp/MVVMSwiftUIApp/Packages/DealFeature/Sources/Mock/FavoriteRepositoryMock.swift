//
//  FavoriteRepositoryMock.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 11.05.2025.
//

import Combine
import Repository

final class FavoriteRepositoryMock {
    @Published
    private var favorites: Set<String> = [
    ]
}

// MARK: - FavoriteRepository
extension FavoriteRepositoryMock: FavoriteRepository {
    var favoritesPublisher: AnyPublisher<Set<String>, Never> {
        $favorites.eraseToAnyPublisher()
    }
    
    func add(_ dealID: String) async throws {
        favorites.insert(dealID)
    }
    
    func remove(_ dealID: String) async throws {
        favorites.remove(dealID)
    }
    
    func isFavorite(dealID: String) -> Bool {
        favorites.contains(dealID)
    }
}
