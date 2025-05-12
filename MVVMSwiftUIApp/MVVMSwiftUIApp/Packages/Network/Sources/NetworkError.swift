//
//  NetworkError.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 21.04.2025.
//

import Foundation

enum NetworkError: Error {
    case badURLResponse(underlyingError: Error)
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case let .badURLResponse(error):
            "Failed to parse URL response: \(error.localizedDescription)."
        }
    }
}
