//
//  SwiftDataFavoriteRepository.swift
//  Repository
//
//  Created by Lev Iakimov on 14.06.2025.
//

import Combine
import Foundation
import SwiftData

@available(iOS 17, *)
public final class SwiftDataFavoriteRepository {
    @Published
    private var favorites: Set<String> = []
    
    public var favoritesPublisher: AnyPublisher<Set<String>, Never> {
        $favorites.eraseToAnyPublisher()
    }
    
    private let modelContext: ModelContext
    
    // MARK: Life cycle
    public init(modelContainer: ModelContainer) {
        // create a new ModelContext independent of the modelContainer.mainContext (not tied to MainActor)
        self.modelContext = ModelContext(modelContainer)
        fetchData()
    }
}

@available(iOS 17, *)
private extension SwiftDataFavoriteRepository {
    func fetchData() {
        let fetchDescriptor = FetchDescriptor<FavoriteDealModel>()
        if let results = try? modelContext.fetch(fetchDescriptor) {
            favorites = Set(results.map(\.dealID))
        }
    }
}

// MARK: - FavoriteRepository
@available(iOS 17, *)
extension SwiftDataFavoriteRepository: FavoriteRepository {
    public func add(_ dealID: String) async throws {
        guard !favorites.contains(dealID) else { return }
        
        let favorite = FavoriteDealModel(dealID: dealID)
        modelContext.insert(favorite)
        
        try modelContext.save()
        favorites.insert(dealID)
    }
    
    public func remove(_ dealID: String) async throws {
        let predicate = #Predicate<FavoriteDealModel> { $0.dealID == dealID }
        let descriptor = FetchDescriptor(predicate: predicate)
        
        let result = try modelContext.fetch(descriptor)
        
        if let favorite = result.first {
            modelContext.delete(favorite)
            
            try modelContext.save()
            favorites.remove(dealID)
        }
    }
    
    public func isFavorite(dealID: String) -> Bool {
        favorites.contains(dealID)
    }
}
