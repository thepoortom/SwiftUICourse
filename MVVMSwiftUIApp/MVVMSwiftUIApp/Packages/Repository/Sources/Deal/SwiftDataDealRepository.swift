//
//  SwiftDataDealRepository.swift
//  Repository
//
//  Created by Lev Iakimov on 14.06.2025.
//

import Combine
import Foundation
import SwiftData

@available(iOS 17, *)
public final class SwiftDataDealRepository {
    @Published
    private var deals: [Deal] = []
    
    public var dealsPublisher: AnyPublisher<[Deal], Never> {
        $deals.eraseToAnyPublisher()
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
private extension SwiftDataDealRepository {
    func fetchData() {
        let fetchDescriptor = FetchDescriptor<DealModel>()
        if let results = try? modelContext.fetch(fetchDescriptor) {
            deals = results.map { deal in
                .init(
                    id: deal.identifier,
                    title: deal.title,
                    gameID: deal.gameID,
                    salePrice: deal.salePrice,
                    normalPrice: deal.normalPrice
                )
            }
        }
    }
}

// MARK: - DealRepository
@available(iOS 17, *)
extension SwiftDataDealRepository: DealRepository {
    public func getDeals() async -> [Deal] {
        deals
    }
    
    public func saveDeals(_ deals: [Deal]) async throws {
        guard !deals.isEmpty else { return }
        
        try modelContext.transaction {
            let fetchDescriptor = FetchDescriptor<DealModel>()
            let existing = try modelContext.fetch(fetchDescriptor)
            existing.forEach {
                modelContext.delete($0)
            }
            
            deals.forEach { deal in
                let dealModel = DealModel(
                    id: deal.id,
                    title: deal.title,
                    gameID: deal.gameID,
                    salePrice: deal.salePrice,
                    normalPrice: deal.normalPrice
                )
                modelContext.insert(dealModel)
            }
            
            try modelContext.save()
        }
        
        self.deals = deals
    }
}
