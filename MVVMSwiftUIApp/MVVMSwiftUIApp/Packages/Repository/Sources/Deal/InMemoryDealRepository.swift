//
//  InMemoryDealRepository.swift
//  Repository
//
//  Created by Lev Iakimov on 14.06.2025.
//

import Combine

public final class InMemoryDealRepository {
    @Published
    private var deals: [Deal] = []
    
    public var dealsPublisher: AnyPublisher<[Deal], Never> {
        $deals.eraseToAnyPublisher()
    }
    
    // MARK: Life cycle
    public init() {
    }
}

// MARK: - DealRepository
extension InMemoryDealRepository: DealRepository {
    public func getDeals() async -> [Deal] {
        deals
    }
    
    public func saveDeals(_ deals: [Deal]) async throws {
        self.deals = deals
    }
}
