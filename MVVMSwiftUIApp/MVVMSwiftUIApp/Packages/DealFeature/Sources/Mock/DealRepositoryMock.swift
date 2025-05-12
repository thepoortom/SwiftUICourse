//
//  DealRepositoryMock.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 11.05.2025.
//

import Combine
import Repository

final class DealRepositoryMock {
    @Published
    private var deals: [Repository.Deal] = [
        .sample,
    ]
}

// MARK: - DealRepository
extension DealRepositoryMock: DealRepository {
    var dealsPublisher: Published<[Repository.Deal]>.Publisher {
        $deals
    }
    
    func getDeals() async -> [Repository.Deal] {
        deals
    }
    
    func saveDeals(_ deals: [Repository.Deal]) async {
        self.deals = deals
    }
}
