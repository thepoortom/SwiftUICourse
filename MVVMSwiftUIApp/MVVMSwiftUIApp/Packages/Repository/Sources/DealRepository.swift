//
//  DealRepository.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 27.04.2025.
//

import Combine

public protocol DealRepository {
    var dealsPublisher: Published<[Deal]>.Publisher { get }
    
    func getDeals() async -> [Deal]
    func saveDeals(_ deals: [Deal]) async
}

public final class InMemoryDealRepository {
    @Published
    private var deals: [Deal] = []
    
    public var dealsPublisher: Published<[Deal]>.Publisher {
        $deals
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
    
    public func saveDeals(_ deals: [Deal]) async {
        self.deals = deals
    }
}
