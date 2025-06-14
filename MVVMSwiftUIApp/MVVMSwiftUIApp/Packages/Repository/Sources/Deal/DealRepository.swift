//
//  DealRepository.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 27.04.2025.
//

import Combine

public protocol DealRepository {
    var dealsPublisher: AnyPublisher<[Deal], Never> { get }
    
    func getDeals() async -> [Deal]
    func saveDeals(_ deals: [Deal]) async throws
}
