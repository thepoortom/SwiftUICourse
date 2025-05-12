//
//  DealNetworkService.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 20.04.2025.
//

import Foundation

public protocol DealNetworkService {
    func fetchDeals(storeID: Int) async throws -> [Deal]
}

public struct DealNetworkServiceImpl {
    private let baseURL: String
    private let session: URLSession = .shared
    private let decoder: JSONDecoder = .init()
    private let path: String = "/deals"
    
    // MARK: Life cycle
    public init(baseURL: String) {
        self.baseURL = baseURL
    }
}

// MARK: - DealNetworkService
extension DealNetworkServiceImpl: DealNetworkService {
    public func fetchDeals(storeID: Int) async throws -> [Deal] {
        
        let url = URL(
            string: baseURL
            + path
            + "?storeID=\(storeID)"
        )!
        
        let (data, urlResponse) = try await session.data(from: url)
        
        guard
            let response = urlResponse as? HTTPURLResponse,
            response.statusCode == 200
        else {
            throw NetworkError.badURLResponse(
                underlyingError: NSError(
                    domain: "DataFetcher",
                    code: (urlResponse as? HTTPURLResponse)?.statusCode ?? -1,
                    userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP Response"]
                )
            )
        }
        
        return try decoder.decode([Deal].self, from: data)
    }
}
