//
//  FavoriteRepository.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 10.05.2025.
//

import Combine

public protocol FavoriteRepository {
    var favoritesPublisher: AnyPublisher<Set<String>, Never> { get }
    
    func add(_ dealID: String) async throws
    func remove(_ dealID: String) async throws
    func isFavorite(dealID: String) -> Bool
}
