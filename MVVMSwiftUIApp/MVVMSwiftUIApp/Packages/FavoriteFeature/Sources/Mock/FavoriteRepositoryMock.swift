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
        "HhzMJAgQYGZ%2B%2BFPpBG%2BRFcuUQZJO3KXvlnyYYGwGUfU%3D",
    ]
}

// MARK: - FavoriteRepository
extension FavoriteRepositoryMock: FavoriteRepository {
    var favoritesPublisher: Published<Set<String>>.Publisher {
        $favorites
    }
    
    func add(_ dealID: String) async {
        favorites.insert(dealID)
    }
    
    func remove(_ dealID: String) async {
        favorites.remove(dealID)
    }
    
    func isFavorite(dealID: String) -> Bool {
        favorites.contains(dealID)
    }
}
