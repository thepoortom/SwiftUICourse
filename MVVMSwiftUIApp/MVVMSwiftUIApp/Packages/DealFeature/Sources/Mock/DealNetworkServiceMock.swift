//
//  DealNetworkServiceMock.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 27.04.2025.
//

import Network

struct DealNetworkServiceMock {
}

// MARK: - DealNetworkService
extension DealNetworkServiceMock: DealNetworkService {
    func fetchDeals(storeID: Int) async throws -> [Network.Deal] {
        []
    }
}
